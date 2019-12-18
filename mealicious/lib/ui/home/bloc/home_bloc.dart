import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mealicious/data/repository/meal_repository.dart';
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => InitialHomeState();
  final MealRepository _mealRepository;
  HomeBloc(this._mealRepository) : super();

  @override
  Stream<HomeState> mapEventToState(
    HomeState state,
    HomeEvent event,
  ) async* {
    if (event is FetchInitated) {
    } else if (event is FetchInitated) {}
    // TODO: Add Logic
  }

  Stream<HomeState> _fetchLatestMeals() async* {
    yield MealLoading();
    try {
      final fetchResults = _mealRepository.searchLatestMeals();
      yield MealLoaded(fetchResults);
    } catch (_) {
      yield MealLoadEror();
    }
  }
}
