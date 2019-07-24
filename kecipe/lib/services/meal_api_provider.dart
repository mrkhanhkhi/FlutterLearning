import 'package:dio/dio.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/models/meal_model.dart';

class MealApiProvider {
  final Dio _dio = Dio();

  Future<MealModel> getMeals(String mealType) async {
    final String _endpoint = "https://api.edamam.com/search?q=$mealType&app_id=$kAppID&app_key=$kAppKey&from=0&to=100&calories=0-3000";
    try {
      Response response = await _dio.get(_endpoint);
      return MealModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}