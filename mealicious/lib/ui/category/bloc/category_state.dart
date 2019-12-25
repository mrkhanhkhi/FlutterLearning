import 'package:mealicious/data/model/categories/category.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoryState {}

class InitialCategoriesState extends CategoryState {}

class CategoriesLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<Category> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesLoadError extends CategoryState {
  @override
  List<Object> get props => [];
}
