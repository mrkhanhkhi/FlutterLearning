import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kecipe/services/bloc_provider.dart';

class MealFavoriteBloc implements BlocBase {

  ///
  /// A stream only meant to return whether THIS movie is part of the favorites
  ///
  final BehaviorSubject<bool> _isFavoriteController = BehaviorSubject<bool>();
  Stream<bool> get outIsFavorite => _isFavoriteController.stream;

  ///
  /// Stream of all the favorites
  ///
  final StreamController<List<Recipe>> _favoritesController = StreamController<List<Recipe>>();
  Sink<List<Recipe>> get inFavorites => _favoritesController.sink;

  ///
  /// Constructor
  ///
  MealFavoriteBloc(Recipe recipe){
    //
    // We are listening to all favorites
    //
    _favoritesController.stream
                        // but, we only consider the one that matches THIS one
                        .map((list) => list.any((Recipe item) => item.label == recipe.label))
                        // if any, we notify that it is part of the Favorites
                        .listen((isFavorite) => _isFavoriteController.add(isFavorite));
  }

  void dispose(){
    _favoritesController.close();
    _isFavoriteController.close();
  }

}
