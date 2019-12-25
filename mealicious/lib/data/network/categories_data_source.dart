import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mealicious/data/model/categories/category.dart';

const String API_KEY = '9973533';

class CategoriesDatasource {
  final http.Client client;

  final String _baseUrl = "https://www.themealdb.com/api/json/v2/$API_KEY";

  CategoriesDatasource(this.client);

  Future<Categories> getCategories() async {
    final urlRaw = _baseUrl + "/categories.php";
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) {
      return Categories.fromJson(json.decode(response.body));
    } else {
      throw GetCategoriesError('Error');
    }
  }
}

class GetCategoriesError implements Exception {
  final String message;
  GetCategoriesError(this.message);
}
