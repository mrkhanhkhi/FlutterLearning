import 'package:flutter/cupertino.dart';
import 'package:kecipe/models/meal_model.dart';
import 'package:kecipe/services/meal_api_provider.dart';
import 'package:kecipe/services/meal_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc_base.dart';
import 'dart:async';
import 'dart:collection';

class RecipeFavoriteBloc implements BlocBase {
  
  ///
  /// Unique list of all favorite recipe
  ///
  final Set<RecipeModel> _favorites = Set<RecipeModel>();

  // ##########  STREAMS  ##############
  ///
  /// Interface that allows to add a new favorite recipe
  ///
  BehaviorSubject<RecipeModel> _favoriteAddController = new BehaviorSubject<RecipeModel>();
  Sink<RecipeModel> get inAddFavorite => _favoriteAddController.sink;

  ///
  /// Interface that allows to remove a meal from the list of favorites
  ///
  BehaviorSubject<RecipeModel> _favoriteRemoveController = new BehaviorSubject<RecipeModel>();
  Sink<RecipeModel> get inRemoveFavorite => _favoriteRemoveController.sink;

   ///
  /// Interface that allows to get the total number of favorites
  ///
  BehaviorSubject<int> _favoriteTotalController = new BehaviorSubject<int>(seedValue: 0);
  Sink<int> get _inTotalFavorites => _favoriteTotalController.sink;
  Stream<int> get outTotalFavorites => _favoriteTotalController.stream;

   ///
  /// Interface that allows to get the list of all favorite recipes
  ///
  BehaviorSubject<List<RecipeModel>> _favoritesController = new BehaviorSubject<List<RecipeModel>>(seedValue: []);
  Sink<List<RecipeModel>> get _inFavorites =>_favoritesController.sink;
  Stream<List<RecipeModel>> get outFavorites =>_favoritesController.stream;

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

  void _handleAddFavorite(RecipeModel movieCard){
    // Add the movie to the list of favorite ones
    _favorites.add(movieCard);

    _notify();
  }

  void _handleRemoveFavorite(RecipeModel movieCard){
    _favorites.remove(movieCard);

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

final bloc = RecipeFavoriteBloc();