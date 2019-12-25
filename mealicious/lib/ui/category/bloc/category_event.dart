import 'package:meta/meta.dart';

@immutable
abstract class CategoryEvent {}

class StartLoadCategories extends CategoryEvent {}

class LoadCategories extends CategoryEvent {}
