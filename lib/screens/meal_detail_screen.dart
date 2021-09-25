import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routerName = "/meal_detail_screen";
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(String title, context) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildContainer(Widget childWidget, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: MediaQuery.of(context).size.width * 0.85,
      child: childWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummy_meals.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(
              Center(
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).accentColor),
                    child: Text(selectedMeal.ingredients[index]),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              context,
            ),
            buildSectionTitle("Step", context),
            buildContainer(
              Center(
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "# ${index + 1}",
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
              context,
            ),
          ],
        ),
      ),
    );
  }
}
