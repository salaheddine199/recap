import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  static const String _apiKey = "b1e9e696237442d0911d4c978bf16552";

  static init() {
    _dio = Dio(
      BaseOptions(
          baseUrl: "https://newsapi.org/", receiveDataWhenStatusError: true),
    );
  }

  static Future<Response?> getTechData() async {
    try {
      return await _dio.get(
        "v2/top-headlines",
        queryParameters: {
          //country=us&category=technology&apiKey=b1e9e696237442d0911d4c978bf16552
          "country": "us",
          "category": "technology",
          "apiKey": _apiKey,
        },
      );
    } catch (e) {
      print("Error while getting data dio_helper.dart: $e");
      return null;
    }
  }

  static Future<Response?> getHealthData() async {
    try {
      return await _dio.get(
        "v2/top-headlines",
        queryParameters: {
          "country": "us",
          "category": "health",
          "apiKey": _apiKey,
        },
      );
    } catch (e) {
      print("Error while getting data dio_helper.dart: $e");
      return null;
    }
  }

  static Future<Response?> getSportsData() async {
    try {
      return await _dio.get(
        "v2/top-headlines",
        queryParameters: {
          "country": "us",
          "category": "sports",
          "apiKey": _apiKey,
        },
      );
    } catch (e) {
      print("Error while getting data dio_helper.dart: $e");
      return null;
    }
  }

  static Future<Response?> searchData(String searching) async {
    //https://newsapi.org/v2/everything?q=hhhkachHaja&apiKey=b1e9e696237442d0911d4c978bf16552
    try {
      return await _dio.get(
        "v2/everything",
        queryParameters: {
          "q": searching,
          "apiKey": _apiKey,
        },
      );
    } catch (e) {
      print("Error while searching data dio_helper.dart: $e");
      return null;
    }
  }
}



  // static Future<Response?> getOtherTypeData({
  //   required String method,
  //   required Map<String, dynamic> query,
  // }) async {
  //   try {
  //     return await _dio.get(
  //       method,
  //       queryParameters: query,
  //     );
  //   } catch (e) {
  //     print("Error while getting data dio_helper.dart: $e");
  //     return null;
  //   }
  // }
