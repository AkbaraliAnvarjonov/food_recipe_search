import 'package:food_recipe/data/models/hint_model.dart';

abstract class FoodsState {}

class FoodsInitial extends FoodsState {}

class GetFoodsInProgressState extends FoodsState {}

class GetFoodsInSuccessState extends FoodsState {
  List<Hint> foods;

  GetFoodsInSuccessState({required this.foods});
}

class GetFoodsInFailuryState extends FoodsState {
  String error;
  GetFoodsInFailuryState({required this.error});
}
