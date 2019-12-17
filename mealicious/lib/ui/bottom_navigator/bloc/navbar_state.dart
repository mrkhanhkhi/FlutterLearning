import 'package:meta/meta.dart';

@immutable
abstract class NavbarState {}

class InitialNavbarState extends NavbarState {}

class ShowSearchView extends NavbarState {
  final String title = "Search";
  final int itemIndex = 0;
}

class ShowFavoriteView extends NavbarState {
  final String title = "Favorite";
  final int itemIndex = 1;
}

class ShowCartView extends NavbarState {
  final String title = "Cart";
  final int itemIndex = 2;
}

class ShowSettingView extends NavbarState {
  final String title = "Setting";
  final int itemIndex = 3;
}
