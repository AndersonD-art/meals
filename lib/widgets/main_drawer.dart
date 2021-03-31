import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
        color: Colors.white,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(79, 165, 214, 1),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              color: Theme.of(context).primaryColor,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Vamos Cozinhar?",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _createItem(
              Icons.restaurant,
              "Refeições",
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
            ),
            _createItem(
              Icons.settings,
              "Configurações",
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.SETTINGS),
            ),
          ],
        ),
      ),
    );
  }
}
