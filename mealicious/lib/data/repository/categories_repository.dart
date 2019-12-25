import 'package:mealicious/data/model/categories/category.dart';
import 'package:mealicious/data/model/detail/meal_model.dart';
import 'package:mealicious/data/network/categories_data_source.dart';

class CategoriesRepository {
  CategoriesDatasource _datasource;
  CategoriesRepository(this._datasource);

  Future<List<Category>> getCategories() async {
    final categoriesResult = await _datasource.getCategories();
    if (categoriesResult.categories.isEmpty)
      throw NoCategoriesResultsException();
    return categoriesResult.categories;
  }
}

class NoCategoriesResultsException implements Exception {
  final message = "No categories results";
}
