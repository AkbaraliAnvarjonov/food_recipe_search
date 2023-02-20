import 'package:food_recipe/data/models/hit_model.dart';
import 'package:food_recipe/data/models/next_model.dart';

class SearchModel {
  SearchModel({
    required this.from,
    required this.to,
    required this.count,
    required this.next,
    required this.hits,
  });

  int from;
  int to;
  int count;
  Next next;
  List<Hit> hits;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        from: json["from"] ?? 0,
        to: json["to"] ?? 0,
        count: json["count"] ?? 0,
        next: Next.fromJson(json["_links"]["next"]),
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );
}
