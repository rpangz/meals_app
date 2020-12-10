import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meals.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;
  TabsScreen(this.favoritedMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  initState() {
    _pages = [
      {'title': 'Category Items', 'routes': CategoriesScreen()},
      {
        'title': 'Favorites Item',
        'routes': FavoritesScreen(widget.favoritedMeals)
      },
    ];
    super.initState();
  }

  int selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedIndex]['routes'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: (index) => _selectedPage(index),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Category'),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Favorites'),
            icon: Icon(Icons.star),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
