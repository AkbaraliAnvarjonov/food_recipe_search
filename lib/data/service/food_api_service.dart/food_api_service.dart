import 'package:dio/dio.dart';
import 'package:food_recipe/data/models/search_model.dart';
import 'package:food_recipe/data/my_response/my_response.dart';
import 'package:food_recipe/data/service/food_api_service.dart/api_client.dart';

class FoodApiService extends ApiClient {
  Future<MyResponse> getSearchingFoods() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(
          "https://api.edamam.com/api/recipes/v2?type=public&q=chees&app_id=d67758a6&app_key=deae164c6f429af9b1a4a40f36125a83");

      if (response.statusCode == 200) {
        myResponse.data = SearchModel.fromJson(response.data);
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
