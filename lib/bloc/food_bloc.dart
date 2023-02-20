import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/food_event.dart';
import 'package:food_recipe/bloc/food_state.dart';
import 'package:food_recipe/data/my_response/my_response.dart';
import 'package:food_recipe/data/service/food_api_service.dart/food_api_service.dart';
import 'package:food_recipe/get_it/get_it_meals.dart';

class FoodsBloc extends Bloc<FoodsEvent, FoodsState> {
  FoodsBloc() : super(FoodsInitial()) {
    on<FetchSearchingFoods>(getDefaultFood);
  }

  getDefaultFood(FetchSearchingFoods event, Emitter<FoodsState> emit) async {
    emit(GetFoodsInProgressState());
    MyResponse myResponse = await getIt<FoodApiService>().getSearchingFoods();
    if (myResponse.error.isEmpty) {
      emit(GetFoodsInSuccessState(hits: myResponse.data!.hits));
    } else {
      emit(GetFoodsInFailuryState(error: myResponse.error));
    }
  }
}
