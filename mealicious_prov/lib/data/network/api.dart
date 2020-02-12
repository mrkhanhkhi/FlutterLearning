import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mealicious_prov/data/model/category.dart';
import 'package:mealicious_prov/data/model/latest_meal.dart';

const String API_KEY = '9973533';

class Api {
  static String _baseUrl = "https://www.themealdb.com/api/json/v2/$API_KEY";
  static String latest = _baseUrl + "/latest.php";
  static String categories = _baseUrl + "/categories.php";

  static Future<LatestMeals> getLatestMeals(String url) async {
    Dio dio = Dio();

    var res = await dio.get(url);
    LatestMeals latestMeals;
    if (res.statusCode == 200) {
      latestMeals = LatestMeals.fromJson(res.data);
    } else {
      throw ("Error ${res.statusCode}");
    }

    return latestMeals;
  }

  static Future<Categories> getCategories(String url) async {
    Dio dio = Dio();

    var res = await dio.get(url);
    Categories categories;
    if (res.statusCode == 200) {
      categories = Categories.fromJson(res.data);
    } else {
      throw ("Error ${res.statusCode}");
    }

    return categories;
  }
}
