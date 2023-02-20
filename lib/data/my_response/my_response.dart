import 'package:food_recipe/data/models/food_model.dart';

class MyResponse {
  String error;
  FoodModel? data;

  MyResponse({this.data, this.error = ''});
}
