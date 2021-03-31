import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/material.dart';

class AnimatedDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(
      homePageXValue: 250,
      homePageYValue: 20,
      homePageAngle: 0.0,
      homePageSpeed: 250,
      shadowXValue: 222,
      shadowYValue: 30,
      shadowAngle: 0.0,
      shadowSpeed: 250,
      openIcon: Icon(Icons.menu_open, color: Color(0xFF1f186f)),
      closeIcon: Icon(Icons.arrow_back_ios, color: Color(0xFF1f186f)),
      shadowColor: Color(0xFF4c41a3),
      backgroundGradient: LinearGradient(
        colors: [Color(0xFF4c41a3), Color(0xFF1f186f)],
      ),
      menuPageContent: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlutterLogo(
                size: MediaQuery.of(context).size.width / 4,
              ),
              Row(
                children: [
                  Text(
                    "FLUTTER",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "HOLIC",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue[200],
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
              ),
              Text(
                "Home Screen",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Text(
                "Screen 2",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Divider(
                color: Color(0xFF5950a0),
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Text(
                "About",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      homePageContent: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue[200],
        child: Center(
          child: Image.network(
            "https://user-images.githubusercontent.com/38032118/105316779-2a480980-5be3-11eb-900e-18fcd599493d.png",
            height: MediaQuery.of(context).size.height / 2,
          ),
        ),
      ),
    );
  }
}
