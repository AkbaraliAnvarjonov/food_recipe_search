import 'package:food_recipe/data/models/food.dart';
import 'package:food_recipe/data/models/measure_model.dart';

class Hint {
  Hint({
    required this.food,
    required this.measures,
  });

  Food food;
  List measures;

  factory Hint.fromJson(Map<String, dynamic> json) => Hint(
        food: Food.fromJson(json["food"] ?? {}),
        measures: json["measures"] ?? [].map((x) => Measure.fromJson(x)),
      );
}
