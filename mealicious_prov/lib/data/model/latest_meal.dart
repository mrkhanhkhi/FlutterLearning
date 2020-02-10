import 'package:mealicious_prov/data/model/meal_model.dart';

class LatestMeals {
  List<MealDetail> _meals;

  LatestMeals({List<MealDetail> meals}) {
    this._meals = meals;
  }

  List<MealDetail> get meals => _meals;
  set meals(List<MealDetail> meals) => _meals = meals;

  LatestMeals.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != String) {
      _meals = new List<MealDetail>();
      json['meals'].forEach((v) {
        _meals.add(new MealDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._meals != String) {
      data['meals'] = this._meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
