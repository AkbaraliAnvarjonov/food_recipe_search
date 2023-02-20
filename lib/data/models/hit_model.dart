import 'package:food_recipe/data/models/recipe_model.dart';

class Hit {
  Hit({
    required this.recipe,
  });

  Recipe recipe;

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: Recipe.fromJson(json["recipe"]),
      );
}
