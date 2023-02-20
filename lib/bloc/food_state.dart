import 'package:food_recipe/data/models/hit_model.dart';
import 'package:food_recipe/data/models/recipe_model.dart';

abstract class FoodsState {}

class FoodsInitial extends FoodsState {}

class GetFoodsInProgressState extends FoodsState {}

class GetFoodsInSuccessState extends FoodsState {
  List<Hit> hits;

  GetFoodsInSuccessState({required this.hits});
}

class GetFoodsInFailuryState extends FoodsState {
  String error;
  GetFoodsInFailuryState({required this.error});
}
