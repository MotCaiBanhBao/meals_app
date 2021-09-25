import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/category_model.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);
  static const routerName = "/category_meals";

  @override
  Widget build(BuildContext context) {
    final Category arg = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = dummy_meals.where((meal) {
      return meal.categories.contains(arg.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(arg.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(item: categoryMeals[index]);
        },

        itemCount: categoryMeals.length,
      ),
    );
  }
}
