import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  @override
  FavoriteState get initialState => InitialFavoriteState();

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is LoadFavoriteMeals) {
      _mapLoadFavoritesToState();
    } else if (event is AddFavoriteMeal) {
      _addFavoriteMealToState(event);
    } else if (event is RemoveFavoriteMeal) {
      _removeFavoriteMealToState(event);
    } else {
      FavoriteMealsError();
    }
    // TODO: Add Logic
  }

  Stream<FavoriteState> _mapLoadFavoritesToState() async* {
    yield FavoriteMealsLoading();
    try {
      await Future.delayed(Duration(seconds: 1));
      yield FavoriteMealsLoaded([]);
    } catch (_) {}
  }

  Stream<FavoriteState> _addFavoriteMealToState(AddFavoriteMeal event) async* {
    final currentState = state;
    if (currentState is FavoriteMealsLoaded) {
      try {
        yield FavoriteMealsLoaded(
            List.from(currentState.favoriteMeals)..add(event.meal));
      } catch (_) {
        FavoriteMealsError();
      }
    }
  }

  Stream<FavoriteState> _removeFavoriteMealToState(
      RemoveFavoriteMeal event) async* {
    final currentState = state;
    if (currentState is FavoriteMealsLoaded) {
      if (currentState.favoriteMeals.contains(event.meal)) {
        currentState.favoriteMeals.remove(event.meal);
      }
      try {
        yield FavoriteMealsLoaded(List.from(currentState.favoriteMeals));
      } catch (_) {
        FavoriteMealsError();
      }
    }
  }
}
