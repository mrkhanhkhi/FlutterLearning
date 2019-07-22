import 'package:flutter/cupertino.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:rxdart/rxdart.dart';

class MealFavoriteBloc with ChangeNotifier {
  Map<int, int> _favoriteList = {};
  Map<int, int> get favoriteList => _favoriteList;
  final MealRepository _mealRepository = MealRepository();
  final PublishSubject<MealModel> _subject =
  PublishSubject<MealModel>();

  getMeal(String mealType) async {
    MealModel response = await _mealRepository.getMeals(mealType);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  PublishSubject<MealModel> get subject => _subject;

}

final bloc = MealFavoriteBloc();