import 'package:food_recipe/data/models/hint_model.dart';
import 'package:food_recipe/data/models/links_model.dart';

class FoodModel {
  FoodModel({
    required this.text,
    required this.parsed,
    required this.hints,
    required this.links,
  });

  String text;
  List<dynamic> parsed;
  List<Hint> hints;
  Links links;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        text: json["text"],
        parsed: List<dynamic>.from(json["parsed"].map((x) => x)),
        hints: List<Hint>.from(json["hints"].map((x) => Hint.fromJson(x))),
        links: Links.fromJson(json["_links"]),
      );
}
