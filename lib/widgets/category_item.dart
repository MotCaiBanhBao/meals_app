import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meal_screen.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Category item;
  const CategoryItem({Key? key, required this.item}) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoryMealsScreen.routerName, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          item.title,
          style: Theme.of(context).textTheme.caption,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(0.7),
              item.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
