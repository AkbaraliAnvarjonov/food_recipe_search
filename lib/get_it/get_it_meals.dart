import 'package:food_recipe/bloc/food_bloc.dart';
import 'package:food_recipe/data/service/food_api_service.dart/food_api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => FoodApiService());
  getIt.registerLazySingleton(() => FoodsBloc());
}
