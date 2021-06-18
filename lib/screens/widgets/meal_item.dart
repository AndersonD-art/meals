import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/routes/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: '${meal.title}',
                    child: Image.network(
                      meal.imageUrl,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 280,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: null,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.watch_outlined,
                        color: Colors.white54,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "${meal.duration} min.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.room_service_outlined,
                        color: Colors.white54,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.complexityText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.white54,
                      ),
                      Text(
                        meal.costText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
