import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mealicious/data/model/home/latest_meals.dart';

const String API_KEY = '9973533';

class MealDatasource {
  final http.Client client;

  final String _baseUrl = "https://www.themealdb.com/api/json/v2/1/$API_KEY";

  MealDatasource(this.client);

  Future<LatestMeals> getLatestMeals() async {
    final urlRaw = _baseUrl + "/latest.php";
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) {
      return LatestMeals.fromJson(json.decode(response.body)['meals']);
    } else {
      throw GetLatestMealsError('Error');
    }
  }
}

class GetLatestMealsError implements Exception {
  final String message;
  GetLatestMealsError(this.message);
}
