import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal_model.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  const FavoriteScreen({Key? key, required this.favoriteMeal})
      : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeal.isEmpty) {
      return const Center(
        child: Text("You have no favorite meal yet"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(item: widget.favoriteMeal[index]);
        },
        itemCount: widget.favoriteMeal.length,
      );
    }
  }
}
