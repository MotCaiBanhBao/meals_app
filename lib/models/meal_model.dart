enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  String get getComplexity {
    switch (complexity) {
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
      case Complexity.simple:
        return "Simple";
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      case Affordability.pricey:
        return "Pricey";
    }
  }

  const Meal({
    required this.isLactoseFree,
    required this.duration,
    required this.categories,
    required this.id,
    required this.title,
    required this.affordability,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.complexity,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
