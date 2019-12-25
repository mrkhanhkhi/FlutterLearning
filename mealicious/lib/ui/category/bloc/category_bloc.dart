import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mealicious/data/repository/categories_repository.dart';
import './bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  @override
  CategoryState get initialState => InitialCategoriesState();
  final CategoriesRepository _categoriesRepository;
  CategoryBloc(this._categoriesRepository) : super();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryState state,
    CategoryEvent event,
  ) async* {
    if (event is StartLoadCategories) {
      yield* _fetchCategories();
    }
    // TODO: Add Logic
  }

  Stream<CategoryState> _fetchCategories() async* {
    yield CategoriesLoading();
    try {
      final fetchResults = await _categoriesRepository.getCategories();
      yield CategoriesLoaded(fetchResults);
    } catch (_) {
      yield CategoriesLoadError();
    }
  }
}
