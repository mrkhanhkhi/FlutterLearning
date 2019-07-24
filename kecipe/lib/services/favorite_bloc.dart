import 'dart:async';
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:kecipe/services/bloc_provider.dart';
import 'package:kecipe/models/meal_model.dart';

class FavoriteBloc implements BlocBase {
  final Set<Recipe> _favorites = Set<Recipe>();

  BehaviorSubject<Recipe> _favoriteAddController = new BehaviorSubject<Recipe>();
  Sink<Recipe> get inAddFavorite => _favoriteAddController.sink;

  ///
  /// Interface that allows to remove a movie from the list of favorites
  ///
  BehaviorSubject<Recipe> _favoriteRemoveController = new BehaviorSubject<Recipe>();
  Sink<Recipe> get inRemoveFavorite => _favoriteRemoveController.sink;

  ///
  /// Interface that allows to get the total number of favorites
  ///
  BehaviorSubject<int> _favoriteTotalController = new BehaviorSubject<int>(seedValue: 0);
  Sink<int> get _inTotalFavorites => _favoriteTotalController.sink;
  Stream<int> get outTotalFavorites => _favoriteTotalController.stream;

  ///
  /// Interface that allows to get the list of all favorite recipes
  ///
  BehaviorSubject<List<Recipe>> _favoritesController = new BehaviorSubject<List<Recipe>>(seedValue: []);
  Sink<List<Recipe>> get _inFavorites =>_favoritesController.sink;
  Stream<List<Recipe>> get outFavorites =>_favoritesController.stream;

  ///
  /// Constructor
  ///
  FavoriteBloc(){
    _favoriteAddController.listen(_handleAddFavorite);
    _favoriteRemoveController.listen(_handleRemoveFavorite);
  }

  void dispose(){
    _favoriteAddController.close();
    _favoriteRemoveController.close();
    _favoriteTotalController.close();
    _favoritesController.close();
  }

  // ############# HANDLING  #####################

  void _handleAddFavorite(Recipe recipe){
    // Add the movie to the list of favorite ones
    _favorites.add(recipe);

    _notify();
  }

  void _handleRemoveFavorite(Recipe recipe){
    _favorites.remove(recipe);

    _notify();
  }

  void _notify(){
    // Send to whomever is interested...
    // The total number of favorites
    _inTotalFavorites.add(_favorites.length);

    // The new list of all favorite movies
    _inFavorites.add(UnmodifiableListView(_favorites));
  }
}