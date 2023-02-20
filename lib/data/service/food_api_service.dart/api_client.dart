import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/data/service/food_api_service.dart/custom_exceptions.dart';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;
  String apiKey = "8e47468597f57cbc7430b56a30fa3baa";
  String appId = "983f0b1c";

  _init() {
    dio = Dio(BaseOptions(
        baseUrl:
            "https://api.edamam.com/api/food-database/v2/parser?session=80&app_id=$appId&app_key=$apiKey",
        connectTimeout: const Duration(milliseconds: 25000),
        receiveTimeout: const Duration(milliseconds: 20000)));

    dio.interceptors.add(InterceptorsWrapper(onError: ((error, handler) {
      debugPrint("Error has accured");
      switch (error.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
          throw DeadlineExceededException(error.requestOptions);
        case DioErrorType.receiveTimeout:
          throw ReceiveTimeOutException(error.requestOptions);
        case DioErrorType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              throw BadRequestException(error.response?.data['message']);
            case 401:
              throw UnauthorizedException(error.requestOptions);
            case 404:
              throw NotFoundException(error.requestOptions);
            case 409:
              throw ConflictException(error.requestOptions);
            case 500:
            case 501:
            case 503:
              throw InternalServerErrorException(error.requestOptions);
          }
          break;
        case DioErrorType.cancel:
          throw CancelException(error.requestOptions);
        case DioErrorType.badCertificate:
          throw BadCertificateException(error.requestOptions);
        case DioErrorType.connectionError:
          throw NoInternetConnectionException(error.requestOptions);
        case DioErrorType.unknown:
          throw UnkownException(error.requestOptions);
      }
      debugPrint('Error Status Code:${error.response?.statusCode}');
      return handler.next(error);
    }), onRequest: (requestOptions, handler) {
      debugPrint("Request sent");
      String currentLocale = "uz";
      requestOptions.headers["Accept"] = "application/json";
      requestOptions.headers["Accept-Language"] =
          currentLocale.isEmpty ? "ru" : currentLocale;
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("Response has recieved");
      return handler.next(response);
    }));
  }
}
