import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  Function setFilter;
  Map<String, Object> filterData;
  FilterScreen(this.filterData, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  initState() {
    _glutenFree = widget.filterData['gluten'];
    _vegetarian = widget.filterData['vegetarian'];
    _vegan = widget.filterData['lactose'];
    _lactoseFree = widget.filterData['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      bool status, String title, String description, Function updateData) {
    return SwitchListTile(
      value: status,
      onChanged: updateData,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  // void _showToast(BuildContext context, String message) {
  //   final scaffold = Scaffold.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //       content: const Text('Added to favorite'),
  //       action: SnackBarAction(
  //           label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.setFilter({
                  'gluten': _glutenFree,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                });
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              // color: Colors.black45,
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your selection meals!',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    _glutenFree,
                    'Gluten Free',
                    'Only include gluten free meals',
                    (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    _vegetarian,
                    'Vegetarian',
                    'Only include vegetarian meals',
                    (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    _vegan,
                    'Vegan',
                    'Only include vegan meals',
                    (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    _lactoseFree,
                    'Lactose',
                    'Only include lactose meals',
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
