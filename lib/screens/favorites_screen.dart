import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meals.dart';
import 'package:flutter_complete_guide/widgets/favorites_item.dart';
import 'package:flutter_complete_guide/widgets/meals_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  FavoritesScreen(this.favoritedMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.favoritedMeals.length == 0
          ? Center(
              child: Text('No Data Found !!'),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(child: Text(categoryMeals[index].title));
                return MealsItem(
                  title: widget.favoritedMeals[index].title,
                  id: widget.favoritedMeals[index].id,
                  imageUrl: widget.favoritedMeals[index].imageUrl,
                  duration: widget.favoritedMeals[index].duration,
                  complexity: widget.favoritedMeals[index].complexity,
                  affordability: widget.favoritedMeals[index].affordability,
                  // removeMeal: _removeMeal,
                );
              },
              itemCount: widget.favoritedMeals.length,
            ),
    );
  }
}
