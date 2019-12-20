import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'package:mealicious/data/network/meal_data_source.dart';
import 'package:mealicious/data/repository/meal_repository.dart';
import 'package:mealicious/ui/home/bloc/home_bloc.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => MealDatasource(c.resolve()))
    ..registerFactory((c) => MealRepository(c.resolve()))
    ..registerFactory((c) => HomeBloc(c.resolve()));
}
