import 'package:flutter/material.dart';
import 'package:meals_app/screens/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routerName = "/filter";
  final Function saveFilter;
  final Map<String, bool> currentFilter;
  const FilterScreen({
    Key? key,
    required this.saveFilter,
    required this.currentFilter,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'] as bool;
    _vegetarian = widget.currentFilter['vegetarian'] as bool;
    _vegan = widget.currentFilter['vegan'] as bool;
    _lactoseFree = widget.currentFilter['lactose'] as bool;
    super.initState();
  }

  Widget buildSwitchListTitle(
      String title, String des, bool value, Function updateValue) {
    return Expanded(
      child: SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(des),
        onChanged: (newValue) => updateValue(newValue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filter"),
        actions: [
          IconButton(
            onPressed: () {
              widget.saveFilter({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Thành công"),
                ),
              );
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust our meal selection",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          buildSwitchListTitle(
              "Không chứa gluten",
              "Chỉ hiện thị những món không có chứa gluten",
              _glutenFree, (newValue) {
            setState(
              () {
                _glutenFree = newValue;
              },
            );
          }),
          buildSwitchListTitle(
              "Không chứa Lactose",
              "Chỉ hiện thị những món không có chứa Lactose",
              _lactoseFree, (newValue) {
            setState(
              () {
                _lactoseFree = newValue;
              },
            );
          }),
          buildSwitchListTitle(
              "Các món chay",
              "Chỉ hiện thị các món nửa chay như sửa, ...",
              _vegetarian, (newValue) {
            setState(
              () {
                _vegetarian = newValue;
              },
            );
          }),
          buildSwitchListTitle(
              "Các món thuần chay", "Chỉ hiện thị các món thuần chay", _vegan,
              (newValue) {
            setState(
              () {
                _vegan = newValue;
              },
            );
          }),
        ],
      ),
    );
  }
}
