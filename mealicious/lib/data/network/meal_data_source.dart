import 'package:http/http.dart' as http;

const String API_KEY = '1';

class MealDatasource {
  final http.Client client;

  final String _baseUrl = "https://www.themealdb.com/api/json/v1/1/$API_KEY";

  MealDatasource(this.client);
}
