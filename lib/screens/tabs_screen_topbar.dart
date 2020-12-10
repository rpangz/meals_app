import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';

class TabScreenTopBar extends StatefulWidget {
  @override
  _TabScreenTopBarState createState() => _TabScreenTopBarState();
}

// PAGE INI TIDAK DIGUNAKAN===============================

class _TabScreenTopBarState extends State<TabScreenTopBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // CategoriesScreen(),
            // FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
