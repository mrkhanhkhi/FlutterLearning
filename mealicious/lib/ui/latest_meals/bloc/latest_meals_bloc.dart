import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mealicious/data/repository/meal_repository.dart';
import './bloc.dart';

class LatestMealsBloc extends Bloc<LatestMealsEvent, LatestMealsState> {
  @override
  LatestMealsState get initialState => InitialLatestMealsState();
  final MealRepository _mealRepository;
  LatestMealsBloc(this._mealRepository) : super();

  @override
  Stream<LatestMealsState> mapEventToState(
    LatestMealsEvent event,
  ) async* {
    if (event is StartLoadMeal) {
      yield* _fetchLatestMeals();
    }
    // TODO: Add Logic
  }

  Stream<LatestMealsState> _fetchLatestMeals() async* {
    yield MealLoading();
    try {
      final fetchResults = await _mealRepository.searchLatestMeals();
      yield MealLoaded(fetchResults);
    } catch (_) {
      yield MealLoadEror();
    }
  }
}
