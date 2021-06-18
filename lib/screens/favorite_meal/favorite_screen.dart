import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          child: Text("Nenhuma Refeição foi marcada como Favorita!"),
        ),
      );
    } else {
      return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
