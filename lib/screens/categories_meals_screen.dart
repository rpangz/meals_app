import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meals.dart';
import 'package:flutter_complete_guide/widgets/meals_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoriesMealsScreen(this.availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;

  var _loadedInit = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInit) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryMeals = widget.availableMeals.where((element) {
        return element.categories.contains(
            categoryId); //mengecek category id ada atau tidak di list categoryid
      }).toList();
      _loadedInit = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: categoryMeals.length == 0
          ? Center(
              child: Text('No Data Found !!'),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(child: Text(categoryMeals[index].title));
                return MealsItem(
                  title: categoryMeals[index].title,
                  id: categoryMeals[index].id,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability,
                  // removeMeal: _removeMeal,
                );
              },
              itemCount: categoryMeals.length,
            ),
    );
  }
}
