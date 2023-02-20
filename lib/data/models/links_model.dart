import 'package:food_recipe/data/models/next_model.dart';

class Links {
  Links({
    required this.next,
  });

  Next next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: Next.fromJson(json["next"] ?? {}),
      );
}
