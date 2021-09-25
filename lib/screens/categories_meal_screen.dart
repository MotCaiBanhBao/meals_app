import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);
  static const routerName = "/category_meals";

  @override
  Widget build(BuildContext context) {
    final Category arg = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg.title),
      ),
      body: const Center(
        child: Text("Test"),
      ),
    );
  }
}
