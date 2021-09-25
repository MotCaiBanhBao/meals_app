import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/categories_meal_screen.dart';
import '../screens/categories_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        CategoriesScreen.routerName: (ctx) => const CategoriesScreen(),
        MealDetailScreen.routerName: (ctx) => const MealDetailScreen(),
        CategoryMealsScreen.routerName: (ctx) => const CategoryMealsScreen(),
      },
    );
  }
}
