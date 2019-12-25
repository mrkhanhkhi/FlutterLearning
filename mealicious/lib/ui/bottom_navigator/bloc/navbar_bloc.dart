import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
  @override
  NavbarState get initialState => ShowSearchView();

  @override
  Stream<NavbarState> mapEventToState(NavbarItems event) async* {
    switch (event) {
      case NavbarItems.Favorite:
        yield ShowFavoriteView();
        break;
      case NavbarItems.Cart:
        yield ShowCartView();
        break;
      case NavbarItems.Setting:
        yield ShowSettingView();
        break;
      default:
        yield ShowSearchView();
        break;
    }
  }
}
