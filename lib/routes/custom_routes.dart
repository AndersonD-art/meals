import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    //Caso não queira realizar a transição para a rota principal
    //If you do not want to transition to the main route

    /* if (route.settings.name == '/') {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    ); */

    return SlideTransition(
      position: Tween(
        begin: Offset(1.0, 0.0),
        end: Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}
