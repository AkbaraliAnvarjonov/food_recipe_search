import 'package:dio/dio.dart';
import 'package:food_recipe/data/models/food_model.dart';
import 'package:food_recipe/data/my_response/my_response.dart';
import 'package:food_recipe/data/service/food_api_service.dart/api_client.dart';

class FoodApiService extends ApiClient {
  Future<MyResponse> getDefaultFoods() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(
          "https://api.edamam.com/api/food-database/v2/parser?app_id=983f0b1c&app_key=8e47468597f57cbc7430b56a30fa3baa&nutrition-type=cooking");

      if (response.statusCode == 200) {
        myResponse.data = FoodModel.fromJson(response.data);
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
