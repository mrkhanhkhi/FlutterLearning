class MealByCategory {
  String _strMeal;
  String _strMealThumb;
  String _idMeal;

  MealByCategory({String strMeal, String strMealThumb, String idMeal}) {
    this._strMeal = strMeal;
    this._strMealThumb = strMealThumb;
    this._idMeal = idMeal;
  }

  String get strMeal => _strMeal;
  set strMeal(String strMeal) => _strMeal = strMeal;
  String get strMealThumb => _strMealThumb;
  set strMealThumb(String strMealThumb) => _strMealThumb = strMealThumb;
  String get idMeal => _idMeal;
  set idMeal(String idMeal) => _idMeal = idMeal;

  MealByCategory.fromJson(Map<String, dynamic> json) {
    _strMeal = json['strMeal'];
    _strMealThumb = json['strMealThumb'];
    _idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this._strMeal;
    data['strMealThumb'] = this._strMealThumb;
    data['idMeal'] = this._idMeal;
    return data;
  }
}
