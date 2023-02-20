class Ingredient {
  Ingredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    required this.image,
  });

  String text;
  double quantity;
  String measure;
  String food;
  double weight;
  String foodCategory;
  String foodId;
  String image;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"] as String? ?? "",
        quantity: json["quantity"] ?? 0.0,
        measure: json["measure"] as String? ?? "",
        food: json["food"] as String? ?? "",
        weight: json["weight"] ?? 0,
        foodCategory: json["foodCategory"] as String? ?? "",
        foodId: json["foodId"] as String? ?? "",
        image: json["image"] as String? ?? "",
      );
}
