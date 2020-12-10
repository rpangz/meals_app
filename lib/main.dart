import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/screens/categories_meals_screen.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/filter_screen.dart';
import 'package:flutter_complete_guide/screens/meals_detail_screen.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';

import 'models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'vegetarian': false,
    'lactose': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filter = _filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filter['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filter['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (_filter['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    // untuk mencari index, jika ditemukan indexnya lebih dr 0 jika tidak indexnya -1
    final indexMeal = _favoritedMeals.indexWhere((tx) => tx.id == mealId);
    if (indexMeal >= 0) {
      setState(() {
        _favoritedMeals.removeAt(indexMeal);
      });
    } else {
      setState(() {
        _favoritedMeals.add(DUMMY_MEALS.firstWhere((tx) => tx.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoritedMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoritedMeals),
        CategoriesMealsScreen.routeName: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        MealsDetailScreen.routeName: (ctx) =>
            MealsDetailScreen(_isFavorite, _toggleFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filter, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
