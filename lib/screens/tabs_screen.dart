import 'package:flutter/material.dart';
import 'package:meals_app/screens/main_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../models/meal_model.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  static const String routerName = "/";

  TabsScreen({Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  late List<Map<String, Object>> _listOfScreen;

  @override
  void initState() {
    _listOfScreen = [
      {
        "page": const CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": FavoriteScreen(
          favoriteMeal: widget.favoriteMeal,
        ),
        "title": "Favorite",
      },
    ];
    super.initState();
  }

  void _onSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_listOfScreen[_currentIndex]["title"].toString()),
      ),
      body: _listOfScreen[_currentIndex]["page"] as Widget,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _onSelected(index),
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.category,
              ),
              label: "Categories",
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite,
            ),
            label: "Favorite",
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
