import 'package:food_recipe/data/models/search_model.dart';

class MyResponse {
  String error;
  SearchModel? data;

  MyResponse({this.data, this.error = ''});
}
