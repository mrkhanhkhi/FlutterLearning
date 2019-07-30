  import 'package:flutter/material.dart';
  import 'package:kecipe/services/bloc_provider.dart';
  import 'package:kecipe/services/meal_bloc.dart';
  import 'package:kecipe/services/favorite_bloc.dart';

  class GlobalBloc implements BlocBase {
      MealBloc mealBloc;
      FavoriteBloc favoriteBloc;

      GlobalBloc() {
        mealBloc = MealBloc();
        favoriteBloc = FavoriteBloc();
      }

      void dispose() {
        mealBloc.dispose();
        favoriteBloc.dispose();
      }
  }