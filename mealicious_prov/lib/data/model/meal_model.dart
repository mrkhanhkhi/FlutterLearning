import 'dart:convert';

class Meals {
  List<MealDetail> _meals;

  Meals({List<MealDetail> meals}) {
    this._meals = meals;
  }

  List<MealDetail> get meals => _meals;
  set meals(List<MealDetail> meals) => _meals = meals;

  Meals.fromJson(Map<String, dynamic> json) {
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

class MealDetail {
  int id;
  String _idMeal;
  String _strMeal;
  String _strDrinkAlternate;
  String _strCategory;
  String _strArea;
  String _strInstructions;
  String _strMealThumb;
  String _strTags;
  String _strYoutube;
  String _strIngredient1;
  String _strIngredient2;
  String _strIngredient3;
  String _strIngredient4;
  String _strIngredient5;
  String _strIngredient6;
  String _strIngredient7;
  String _strIngredient8;
  String _strIngredient9;
  String _strIngredient10;
  String _strIngredient11;
  String _strIngredient12;
  String _strIngredient13;
  String _strIngredient14;
  String _strIngredient15;
  String _strIngredient16;
  String _strIngredient17;
  String _strIngredient18;
  String _strIngredient19;
  String _strIngredient20;
  String _strMeasure1;
  String _strMeasure2;
  String _strMeasure3;
  String _strMeasure4;
  String _strMeasure5;
  String _strMeasure6;
  String _strMeasure7;
  String _strMeasure8;
  String _strMeasure9;
  String _strMeasure10;
  String _strMeasure11;
  String _strMeasure12;
  String _strMeasure13;
  String _strMeasure14;
  String _strMeasure15;
  String _strMeasure16;
  String _strMeasure17;
  String _strMeasure18;
  String _strMeasure19;
  String _strMeasure20;
  String _strSource;
  String _dateModified;
  bool isFavorite = false;

  MealDetail(
      {String idMeal,
      String strMeal,
      String strDrinkAlternate,
      String strCategory,
      String strArea,
      String strInstructions,
      String strMealThumb,
      String strTags,
      String strYoutube,
      String strIngredient1,
      String strIngredient2,
      String strIngredient3,
      String strIngredient4,
      String strIngredient5,
      String strIngredient6,
      String strIngredient7,
      String strIngredient8,
      String strIngredient9,
      String strIngredient10,
      String strIngredient11,
      String strIngredient12,
      String strIngredient13,
      String strIngredient14,
      String strIngredient15,
      String strIngredient16,
      String strIngredient17,
      String strIngredient18,
      String strIngredient19,
      String strIngredient20,
      String strMeasure1,
      String strMeasure2,
      String strMeasure3,
      String strMeasure4,
      String strMeasure5,
      String strMeasure6,
      String strMeasure7,
      String strMeasure8,
      String strMeasure9,
      String strMeasure10,
      String strMeasure11,
      String strMeasure12,
      String strMeasure13,
      String strMeasure14,
      String strMeasure15,
      String strMeasure16,
      String strMeasure17,
      String strMeasure18,
      String strMeasure19,
      String strMeasure20,
      String strSource,
      String dateModified}) {
    this._idMeal = idMeal;
    this._strMeal = strMeal;
    this._strDrinkAlternate = strDrinkAlternate;
    this._strCategory = strCategory;
    this._strArea = strArea;
    this._strInstructions = strInstructions;
    this._strMealThumb = strMealThumb;
    this._strTags = strTags;
    this._strYoutube = strYoutube;
    this._strIngredient1 = strIngredient1;
    this._strIngredient2 = strIngredient2;
    this._strIngredient3 = strIngredient3;
    this._strIngredient4 = strIngredient4;
    this._strIngredient5 = strIngredient5;
    this._strIngredient6 = strIngredient6;
    this._strIngredient7 = strIngredient7;
    this._strIngredient8 = strIngredient8;
    this._strIngredient9 = strIngredient9;
    this._strIngredient10 = strIngredient10;
    this._strIngredient11 = strIngredient11;
    this._strIngredient12 = strIngredient12;
    this._strIngredient13 = strIngredient13;
    this._strIngredient14 = strIngredient14;
    this._strIngredient15 = strIngredient15;
    this._strIngredient16 = strIngredient16;
    this._strIngredient17 = strIngredient17;
    this._strIngredient18 = strIngredient18;
    this._strIngredient19 = strIngredient19;
    this._strIngredient20 = strIngredient20;
    this._strMeasure1 = strMeasure1;
    this._strMeasure2 = strMeasure2;
    this._strMeasure3 = strMeasure3;
    this._strMeasure4 = strMeasure4;
    this._strMeasure5 = strMeasure5;
    this._strMeasure6 = strMeasure6;
    this._strMeasure7 = strMeasure7;
    this._strMeasure8 = strMeasure8;
    this._strMeasure9 = strMeasure9;
    this._strMeasure10 = strMeasure10;
    this._strMeasure11 = strMeasure11;
    this._strMeasure12 = strMeasure12;
    this._strMeasure13 = strMeasure13;
    this._strMeasure14 = strMeasure14;
    this._strMeasure15 = strMeasure15;
    this._strMeasure16 = strMeasure16;
    this._strMeasure17 = strMeasure17;
    this._strMeasure18 = strMeasure18;
    this._strMeasure19 = strMeasure19;
    this._strMeasure20 = strMeasure20;
    this._strSource = strSource;
    this._dateModified = dateModified;
  }

  String get idMeal => _idMeal;
  set idMeal(String idMeal) => _idMeal = idMeal;
  String get strMeal => _strMeal;
  set strMeal(String strMeal) => _strMeal = strMeal;
  String get strDrinkAlternate => _strDrinkAlternate;
  set strDrinkAlternate(String strDrinkAlternate) =>
      _strDrinkAlternate = strDrinkAlternate;
  String get strCategory => _strCategory;
  set strCategory(String strCategory) => _strCategory = strCategory;
  String get strArea => _strArea;
  set strArea(String strArea) => _strArea = strArea;
  String get strInstructions => _strInstructions;
  set strInstructions(String strInstructions) =>
      _strInstructions = strInstructions;
  String get strMealThumb => _strMealThumb;
  set strMealThumb(String strMealThumb) => _strMealThumb = strMealThumb;
  String get strTags => _strTags;
  set strTags(String strTags) => _strTags = strTags;
  String get strYoutube => _strYoutube;
  set strYoutube(String strYoutube) => _strYoutube = strYoutube;
  String get strIngredient1 => _strIngredient1;
  set strIngredient1(String strIngredient1) => _strIngredient1 = strIngredient1;
  String get strIngredient2 => _strIngredient2;
  set strIngredient2(String strIngredient2) => _strIngredient2 = strIngredient2;
  String get strIngredient3 => _strIngredient3;
  set strIngredient3(String strIngredient3) => _strIngredient3 = strIngredient3;
  String get strIngredient4 => _strIngredient4;
  set strIngredient4(String strIngredient4) => _strIngredient4 = strIngredient4;
  String get strIngredient5 => _strIngredient5;
  set strIngredient5(String strIngredient5) => _strIngredient5 = strIngredient5;
  String get strIngredient6 => _strIngredient6;
  set strIngredient6(String strIngredient6) => _strIngredient6 = strIngredient6;
  String get strIngredient7 => _strIngredient7;
  set strIngredient7(String strIngredient7) => _strIngredient7 = strIngredient7;
  String get strIngredient8 => _strIngredient8;
  set strIngredient8(String strIngredient8) => _strIngredient8 = strIngredient8;
  String get strIngredient9 => _strIngredient9;
  set strIngredient9(String strIngredient9) => _strIngredient9 = strIngredient9;
  String get strIngredient10 => _strIngredient10;
  set strIngredient10(String strIngredient10) =>
      _strIngredient10 = strIngredient10;
  String get strIngredient11 => _strIngredient11;
  set strIngredient11(String strIngredient11) =>
      _strIngredient11 = strIngredient11;
  String get strIngredient12 => _strIngredient12;
  set strIngredient12(String strIngredient12) =>
      _strIngredient12 = strIngredient12;
  String get strIngredient13 => _strIngredient13;
  set strIngredient13(String strIngredient13) =>
      _strIngredient13 = strIngredient13;
  String get strIngredient14 => _strIngredient14;
  set strIngredient14(String strIngredient14) =>
      _strIngredient14 = strIngredient14;
  String get strIngredient15 => _strIngredient15;
  set strIngredient15(String strIngredient15) =>
      _strIngredient15 = strIngredient15;
  String get strIngredient16 => _strIngredient16;
  set strIngredient16(String strIngredient16) =>
      _strIngredient16 = strIngredient16;
  String get strIngredient17 => _strIngredient17;
  set strIngredient17(String strIngredient17) =>
      _strIngredient17 = strIngredient17;
  String get strIngredient18 => _strIngredient18;
  set strIngredient18(String strIngredient18) =>
      _strIngredient18 = strIngredient18;
  String get strIngredient19 => _strIngredient19;
  set strIngredient19(String strIngredient19) =>
      _strIngredient19 = strIngredient19;
  String get strIngredient20 => _strIngredient20;
  set strIngredient20(String strIngredient20) =>
      _strIngredient20 = strIngredient20;
  String get strMeasure1 => _strMeasure1;
  set strMeasure1(String strMeasure1) => _strMeasure1 = strMeasure1;
  String get strMeasure2 => _strMeasure2;
  set strMeasure2(String strMeasure2) => _strMeasure2 = strMeasure2;
  String get strMeasure3 => _strMeasure3;
  set strMeasure3(String strMeasure3) => _strMeasure3 = strMeasure3;
  String get strMeasure4 => _strMeasure4;
  set strMeasure4(String strMeasure4) => _strMeasure4 = strMeasure4;
  String get strMeasure5 => _strMeasure5;
  set strMeasure5(String strMeasure5) => _strMeasure5 = strMeasure5;
  String get strMeasure6 => _strMeasure6;
  set strMeasure6(String strMeasure6) => _strMeasure6 = strMeasure6;
  String get strMeasure7 => _strMeasure7;
  set strMeasure7(String strMeasure7) => _strMeasure7 = strMeasure7;
  String get strMeasure8 => _strMeasure8;
  set strMeasure8(String strMeasure8) => _strMeasure8 = strMeasure8;
  String get strMeasure9 => _strMeasure9;
  set strMeasure9(String strMeasure9) => _strMeasure9 = strMeasure9;
  String get strMeasure10 => _strMeasure10;
  set strMeasure10(String strMeasure10) => _strMeasure10 = strMeasure10;
  String get strMeasure11 => _strMeasure11;
  set strMeasure11(String strMeasure11) => _strMeasure11 = strMeasure11;
  String get strMeasure12 => _strMeasure12;
  set strMeasure12(String strMeasure12) => _strMeasure12 = strMeasure12;
  String get strMeasure13 => _strMeasure13;
  set strMeasure13(String strMeasure13) => _strMeasure13 = strMeasure13;
  String get strMeasure14 => _strMeasure14;
  set strMeasure14(String strMeasure14) => _strMeasure14 = strMeasure14;
  String get strMeasure15 => _strMeasure15;
  set strMeasure15(String strMeasure15) => _strMeasure15 = strMeasure15;
  String get strMeasure16 => _strMeasure16;
  set strMeasure16(String strMeasure16) => _strMeasure16 = strMeasure16;
  String get strMeasure17 => _strMeasure17;
  set strMeasure17(String strMeasure17) => _strMeasure17 = strMeasure17;
  String get strMeasure18 => _strMeasure18;
  set strMeasure18(String strMeasure18) => _strMeasure18 = strMeasure18;
  String get strMeasure19 => _strMeasure19;
  set strMeasure19(String strMeasure19) => _strMeasure19 = strMeasure19;
  String get strMeasure20 => _strMeasure20;
  set strMeasure20(String strMeasure20) => _strMeasure20 = strMeasure20;
  String get strSource => _strSource;
  set strSource(String strSource) => _strSource = strSource;
  String get dateModified => _dateModified;
  set dateModified(String dateModified) => _dateModified = dateModified;

  MealDetail.fromJson(Map<String, dynamic> json) {
    _idMeal = json['idMeal'];
    _strMeal = json['strMeal'];
    _strDrinkAlternate = json['strDrinkAlternate'];
    _strCategory = json['strCategory'];
    _strArea = json['strArea'];
    _strInstructions = json['strInstructions'];
    _strMealThumb = json['strMealThumb'];
    _strTags = json['strTags'];
    _strYoutube = json['strYoutube'];
    _strIngredient1 = json['strIngredient1'];
    _strIngredient2 = json['strIngredient2'];
    _strIngredient3 = json['strIngredient3'];
    _strIngredient4 = json['strIngredient4'];
    _strIngredient5 = json['strIngredient5'];
    _strIngredient6 = json['strIngredient6'];
    _strIngredient7 = json['strIngredient7'];
    _strIngredient8 = json['strIngredient8'];
    _strIngredient9 = json['strIngredient9'];
    _strIngredient10 = json['strIngredient10'];
    _strIngredient11 = json['strIngredient11'];
    _strIngredient12 = json['strIngredient12'];
    _strIngredient13 = json['strIngredient13'];
    _strIngredient14 = json['strIngredient14'];
    _strIngredient15 = json['strIngredient15'];
    _strIngredient16 = json['strIngredient16'];
    _strIngredient17 = json['strIngredient17'];
    _strIngredient18 = json['strIngredient18'];
    _strIngredient19 = json['strIngredient19'];
    _strIngredient20 = json['strIngredient20'];
    _strMeasure1 = json['strMeasure1'];
    _strMeasure2 = json['strMeasure2'];
    _strMeasure3 = json['strMeasure3'];
    _strMeasure4 = json['strMeasure4'];
    _strMeasure5 = json['strMeasure5'];
    _strMeasure6 = json['strMeasure6'];
    _strMeasure7 = json['strMeasure7'];
    _strMeasure8 = json['strMeasure8'];
    _strMeasure9 = json['strMeasure9'];
    _strMeasure10 = json['strMeasure10'];
    _strMeasure11 = json['strMeasure11'];
    _strMeasure12 = json['strMeasure12'];
    _strMeasure13 = json['strMeasure13'];
    _strMeasure14 = json['strMeasure14'];
    _strMeasure15 = json['strMeasure15'];
    _strMeasure16 = json['strMeasure16'];
    _strMeasure17 = json['strMeasure17'];
    _strMeasure18 = json['strMeasure18'];
    _strMeasure19 = json['strMeasure19'];
    _strMeasure20 = json['strMeasure20'];
    _strSource = json['strSource'];
    _dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeal'] = this._idMeal;
    data['strMeal'] = this._strMeal;
    data['strDrinkAlternate'] = this._strDrinkAlternate;
    data['strCategory'] = this._strCategory;
    data['strArea'] = this._strArea;
    data['strInstructions'] = this._strInstructions;
    data['strMealThumb'] = this._strMealThumb;
    data['strTags'] = this._strTags;
    data['strYoutube'] = this._strYoutube;
    data['strIngredient1'] = this._strIngredient1;
    data['strIngredient2'] = this._strIngredient2;
    data['strIngredient3'] = this._strIngredient3;
    data['strIngredient4'] = this._strIngredient4;
    data['strIngredient5'] = this._strIngredient5;
    data['strIngredient6'] = this._strIngredient6;
    data['strIngredient7'] = this._strIngredient7;
    data['strIngredient8'] = this._strIngredient8;
    data['strIngredient9'] = this._strIngredient9;
    data['strIngredient10'] = this._strIngredient10;
    data['strIngredient11'] = this._strIngredient11;
    data['strIngredient12'] = this._strIngredient12;
    data['strIngredient13'] = this._strIngredient13;
    data['strIngredient14'] = this._strIngredient14;
    data['strIngredient15'] = this._strIngredient15;
    data['strIngredient16'] = this._strIngredient16;
    data['strIngredient17'] = this._strIngredient17;
    data['strIngredient18'] = this._strIngredient18;
    data['strIngredient19'] = this._strIngredient19;
    data['strIngredient20'] = this._strIngredient20;
    data['strMeasure1'] = this._strMeasure1;
    data['strMeasure2'] = this._strMeasure2;
    data['strMeasure3'] = this._strMeasure3;
    data['strMeasure4'] = this._strMeasure4;
    data['strMeasure5'] = this._strMeasure5;
    data['strMeasure6'] = this._strMeasure6;
    data['strMeasure7'] = this._strMeasure7;
    data['strMeasure8'] = this._strMeasure8;
    data['strMeasure9'] = this._strMeasure9;
    data['strMeasure10'] = this._strMeasure10;
    data['strMeasure11'] = this._strMeasure11;
    data['strMeasure12'] = this._strMeasure12;
    data['strMeasure13'] = this._strMeasure13;
    data['strMeasure14'] = this._strMeasure14;
    data['strMeasure15'] = this._strMeasure15;
    data['strMeasure16'] = this._strMeasure16;
    data['strMeasure17'] = this._strMeasure17;
    data['strMeasure18'] = this._strMeasure18;
    data['strMeasure19'] = this._strMeasure19;
    data['strMeasure20'] = this._strMeasure20;
    data['strSource'] = this._strSource;
    data['dateModified'] = this._dateModified;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      "idMeal": idMeal,
      "strMeal": strMeal,
      "strDrinkAlternate": strDrinkAlternate,
      "strCategory": strCategory,
      "strArea": strArea,
      "strInstructions": strInstructions,
      "strMealThumb": strMealThumb,
      "strTags": strTags,
      "strYoutube": strYoutube,
      "strIngredient1": strIngredient1,
      "strIngredient2": strIngredient2,
      "strIngredient3": strIngredient3,
      "strIngredient4": strIngredient4,
      "strIngredient5": strIngredient5,
      "strIngredient6": strIngredient6,
      "strIngredient7": strIngredient7,
      "strIngredient8": strIngredient8,
      "strIngredient9": strIngredient9,
      "strIngredient10": strIngredient10,
      "strIngredient11": strIngredient11,
      "strIngredient12": strIngredient12,
      "strIngredient13": strIngredient13,
      "strIngredient14": strIngredient14,
      "strIngredient15": strIngredient15,
      "strIngredient16": strIngredient16,
      "strIngredient17": strIngredient17,
      "strIngredient18": strIngredient18,
      "strIngredient19": strIngredient19,
      "strIngredient20": strIngredient20,
      "strMeasure1": strMeasure1,
      "strMeasure2": strMeasure2,
      "strMeasure3": strMeasure3,
      "strMeasure4": strMeasure4,
      "strMeasure5": strMeasure5,
      "strMeasure6": strMeasure6,
      "strMeasure7": strMeasure7,
      "strMeasure8": strMeasure8,
      "strMeasure9": strMeasure9,
      "strMeasure10": strMeasure10,
      "strMeasure11": strMeasure11,
      "strMeasure12": strMeasure12,
      "strMeasure13": strMeasure13,
      "strMeasure14": strMeasure14,
      "strMeasure15": strMeasure15,
      "strMeasure16": strMeasure16,
      "strMeasure17": strMeasure17,
      "strMeasure18": strMeasure18,
      "strMeasure19": strMeasure19,
      "strMeasure20": strMeasure20,
      "strSource": strSource,
      "dateModified": dateModified
    };
  }

  static MealDetail fromMap(Map<String, dynamic> map) {
    return MealDetail(
      idMeal: map['idMeal'],
      strMeal: map['strMeal'],
      strDrinkAlternate: map['strDrinkAlternate'],
      strCategory: map['strCategory'],
      strArea: map['strArea'],
      strInstructions: map['strInstructions'],
      strMealThumb: map['strMealThumb'],
      strTags: map['strTags'],
      strYoutube: map['strYoutube'],
      strIngredient1: map['strIngredient1'],
      strIngredient2: map['strIngredient2'],
      strIngredient3: map['strIngredient3'],
      strIngredient4: map['strIngredient4'],
      strIngredient5: map['strIngredient5'],
      strIngredient6: map['strIngredient6'],
      strIngredient7: map['strIngredient7'],
      strIngredient8: map['strIngredient8'],
      strIngredient9: map['strIngredient9'],
      strIngredient10: map['strIngredient10'],
      strIngredient11: map['strIngredient11'],
      strIngredient12: map['strIngredient12'],
      strIngredient13: map['strIngredient13'],
      strIngredient14: map['strIngredient14'],
      strIngredient15: map['strIngredient15'],
      strIngredient16: map['strIngredient16'],
      strIngredient17: map['strIngredient17'],
      strIngredient18: map['strIngredient18'],
      strIngredient19: map['strIngredient19'],
      strIngredient20: map['strIngredient20'],
      strMeasure1: map['strMeasure1'],
      strMeasure2: map['strMeasure2'],
      strMeasure3: map['strMeasure3'],
      strMeasure4: map['strMeasure4'],
      strMeasure5: map['strMeasure5'],
      strMeasure6: map['strMeasure6'],
      strMeasure7: map['strMeasure7'],
      strMeasure8: map['strMeasure8'],
      strMeasure9: map['strMeasure9'],
      strMeasure10: map['strMeasure10'],
      strMeasure11: map['strMeasure11'],
      strMeasure12: map['strMeasure12'],
      strMeasure13: map['strMeasure13'],
      strMeasure14: map['strMeasure14'],
      strMeasure15: map['strMeasure15'],
      strMeasure16: map['strMeasure16'],
      strMeasure17: map['strMeasure17'],
      strMeasure18: map['strMeasure18'],
      strMeasure19: map['strMeasure19'],
      strMeasure20: map['strMeasure20'],
      strSource: map['strSource'],
      dateModified: map['dateModified'],
    );
  }
}
