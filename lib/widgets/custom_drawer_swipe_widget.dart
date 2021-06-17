import 'package:flutter/material.dart';

class CustomDrawerSwipeWidget extends StatefulWidget {
  // Drawer background color
  final Color backgroundColor;

  // screen body
  final Widget child;

  // screen drawerBody
  final Widget drawer;

  //Codigo modificado
  //modified code
  final Widget image;

  //  body width when opening the drawer
  final double bodySize;

  final double bodyBackgroundPeekSize;

  final double radius;

  // animation curve
  final Curve curve;

  /// show the clone body when the drawer if open
  final bool hasClone;

  CustomDrawerSwipeWidget(
      {required this.child,
      required this.drawer,
      required Key key,
      required this.image,
      this.bodySize = 80,
      this.radius = 0,
      this.hasClone = true,
      this.bodyBackgroundPeekSize = 50,
      this.curve = Curves.easeIn,
      this.backgroundColor = Colors.black})
      : super(key: key);

  @override
  CustomDrawerSwipeWidgetState createState() => CustomDrawerSwipeWidgetState();
}

class CustomDrawerSwipeWidgetState extends State<CustomDrawerSwipeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  bool dragging = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation =
        CurvedAnimation(parent: animationController, curve: widget.curve);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //get Directionality
    TextDirection currentDirection = Directionality.of(context);
    bool isRTL = currentDirection == TextDirection.rtl;
    // get Screen Size
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          double scale = .8 + .2 * (1 - animation.value);
          double scaleSmall = .7 + .3 * (1 - animation.value);
          double reverse = isRTL ? -1 : 1;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Transform.translate(
                offset: Offset(0, 0),
                child: InkWell(
                  onTap: () => closeDrawer(),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    color: widget.backgroundColor,
                  ),
                ),
              ),
              if (widget.hasClone)
                //codigo modificado
                //modified code
                Opacity(
                  opacity: .3,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..scale(scaleSmall, scaleSmall)
                      ..translate((reverse) *
                          (size.width -
                              (widget.bodySize +
                                  widget.bodyBackgroundPeekSize)) *
                          (animation.value)),
                    alignment: FractionalOffset.center,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isOpened() ? widget.radius : 0),
                      child: Container(
                        color: Colors.white,
                        child: widget.image,
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                  onHorizontalDragStart: (details) {},
                  behavior: HitTestBehavior.translucent,
                  child: buildAnimationBody(
                      scale, size, widget.bodySize, reverse)),
              Transform.translate(
                offset:
                    Offset(-size.width * (1 - animation.value) * reverse, 0),
                child: buildDrawer(size),
              ),
            ],
          );
        });
  }

  Container buildDrawer(Size size) {
    return Container(
        width: size.width - (widget.bodySize + widget.bodyBackgroundPeekSize),
        child: widget.drawer);
  }

  Transform buildAnimationBody(
      double scale, Size size, double move, double revers) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(scale, scale)
        ..translate((revers) * (size.width - move) * (animation.value)),
      alignment: FractionalOffset.center,
      //offset: Offset((size.width - 100) * (animation.value), 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isOpened() ? widget.radius : 0),
        child: Container(color: Colors.white, child: widget.child),
      ),
    );
  }

  openOrClose() {
    if (isOpened())
      closeDrawer();
    else
      openDrawer();
  }

  openDrawer() {
    animationController.forward();
  }

  closeDrawer() {
    animationController.reverse();
  }

  bool isOpened() {
    return animationController.isCompleted;
  }
}
