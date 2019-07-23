import 'package:dio/dio.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/models/meal_model.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class MealApiProvider {
  final Dio _dio = Dio();

  Future<RecipeModel> getMeals(String mealType) async {
    final String _endpoint = "https://api.edamam.com/search?q=$mealType&app_id=$kAppID&app_key=$kAppKey&from=0&to=100&calories=0-500";
    try {
      Response response = await _dio.get(_endpoint);
      return RecipeModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}

class RecipeAPI {
  static const kAppID = '4b1a3bb6';
  static const kAppKey = 'cf1581846a251a0651e0a46c56af2a16';
  static const String baseUrl = 'api.edamam.com';
  final _httpClient = new HttpClient();

  Future<RecipeModel> recipeList({String type}) async {
    var uri = Uri.https(
      baseUrl,
      'search?q=$type',
      <String, String>{
        'app_key': '$kAppKey',
        'app_id': '$kAppID',
        'from': '0',
        'to': '100',
        'calories': '0-2000',
      },
    );

    var response = await _getRequest(uri);
    RecipeModel list = RecipeModel.fromJson(json.decode(response));

    // await Future.delayed(const Duration(seconds: 1));

    return list;
  }

   Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}