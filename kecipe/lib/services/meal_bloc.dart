import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc {
  final MealRepository _mealRepository = MealRepository();
  final BehaviorSubject<MealModel> _subject =
  BehaviorSubject<MealModel>();

  getMeal(String mealType) async {
    MealModel response = await _mealRepository.getMeals(mealType);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MealModel> get subject => _subject;

}

final bloc = MealBloc();