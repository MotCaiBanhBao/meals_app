import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/data/dummy_data.dart';
import '../models/meal_model.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/categories_meal_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/filter_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = dummy_meals;
  List<Meal> _favoriteMeal = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeal = dummy_meals.where((element) {
        if (!element.isGlutenFree && (_filters['gluten']) as bool) {
          return false;
        }
        if (!element.isLactoseFree && (_filters['lactose']) as bool) {
          return false;
        }
        if (!element.isVegan && (_filters['vegan']) as bool) {
          return false;
        }
        if (!element.isVegetarian && (_filters['vegetarian']) as bool) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeal.indexWhere((element) => mealId == element.id);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal
            .add(dummy_meals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeal",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff774a63),
          titleTextStyle: TextStyle(
            color: Color(0xfffcf1f2),
            fontSize: 20,
            fontFamily: "Raleway",
          ),
        ),
        accentColor: const Color(0xffd6a5c0),
        primaryColor: const Color(0xff774a63),
        canvasColor: const Color(0xfffcf1f2),
        backgroundColor: const Color(0xfffcf1f2),
        fontFamily: "Ralewaty",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color(0xff774a63),
              ),
              bodyText2: const TextStyle(
                color: Color(0xff774a63),
              ),
              caption: const TextStyle(
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: CategoriesScreen.routerName,
      routes: {
        TabsScreen.routerName: (ctx) => TabsScreen(
              favoriteMeal: _favoriteMeal,
            ),
        MealDetailScreen.routerName: (ctx) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavoriteMeal: _isMealFavorite),
        CategoryMealsScreen.routerName: (ctx) => CategoryMealsScreen(
              avalableMeals: _availableMeal,
            ),
        FilterScreen.routerName: (ctx) => FilterScreen(
              saveFilter: _setFilter,
              currentFilter: _filters,
            ),
      },
    );
  }
}
