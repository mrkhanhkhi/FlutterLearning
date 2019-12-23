import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:mealicious/data/model/home/latest_meals.dart';
import 'package:mealicious/data/network/meal_data_source.dart';

class MealRepository {
  MealDatasource _datasource;
  MealRepository(this._datasource);

  Future<List<MealDetail>> searchLatestMeals() async {
    final mealsResult = await _datasource.getLatestMeals();
    if (mealsResult.meals.isEmpty) throw NoMealsResultsException();
    return mealsResult.meals;
  }
}

class NoMealsResultsException implements Exception {
  final message = "No results";
}
