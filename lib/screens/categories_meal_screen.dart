import 'package:flutter/material.dart';
import '../models/meal_model.dart';
import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/category_model.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({Key? key, required this.avalableMeals})
      : super(key: key);
  final List<Meal> avalableMeals;
  static const routerName = "/category_meals";

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> categoryMeals;
  late String categoryTitle;
  var _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      final Category arg =
          ModalRoute.of(context)!.settings.arguments as Category;
      categoryTitle = arg.title;
      categoryMeals = widget.avalableMeals.where((meal) {
        return meal.categories.contains(arg.id);
      }).toList();
      _isInit = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
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
