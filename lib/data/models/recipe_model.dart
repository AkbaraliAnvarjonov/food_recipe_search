import 'package:food_recipe/data/models/ingredients_model.dart';

class Recipe {
  Recipe({
    required this.uri,
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
  });

  String uri;
  String label;
  String image;
  String source;
  String url;
  String shareAs;
  List<Ingredient> ingredients;
  double calories;
  double totalWeight;
  double totalTime;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        uri: json["uri"] as String? ?? "",
        label: json["label"] as String? ?? "",
        image: json["image"] as String? ?? "",
        source: json["source"] as String? ?? "",
        url: json["url"] as String? ?? "",
        shareAs: json["shareAs"] as String? ?? "",
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        calories: json["calories"] ?? 0,
        totalWeight: json["totalWeight"] ?? 0,
        totalTime: json["totalTime"] ?? 0,
      );
}
