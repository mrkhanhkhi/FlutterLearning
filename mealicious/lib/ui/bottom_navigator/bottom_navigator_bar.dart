import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mealicious/ui/bottom_navigator/bloc/navbar_bloc.dart';
import 'package:mealicious/ui/bottom_navigator/bloc/navbar_event.dart';
import 'package:mealicious/ui/bottom_navigator/bloc/navbar_state.dart';
import 'package:mealicious/ui/home/home_page.dart';

class BottomNavigatorBar extends StatefulWidget {
  @override
  _BottomNavigatorBarState createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  NavbarBloc _bottomNavigatorBloc;
  @override
  void initState() {
    super.initState();
    _bottomNavigatorBloc = NavbarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bottomNavigatorBloc,
        builder: (context, NavbarState state) {
          if (state is ShowSearchView)
            return buildHomepage(state, state.title, state.itemIndex);
          if (state is ShowFavoriteView)
            return buildHomepage(state, state.title, state.itemIndex);
          if (state is ShowCartView)
            return buildHomepage(state, state.title, state.itemIndex);
          if (state is ShowSettingView)
            return buildHomepage(state, state.title, state.itemIndex);
        });
  }

  Scaffold buildHomepage(NavbarState state, String title, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildBodyPage(state),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) _bottomNavigatorBloc.add(NavbarItems.Search);
          if (index == 1) _bottomNavigatorBloc.add(NavbarItems.Favorite);
          if (index == 2) _bottomNavigatorBloc.add(NavbarItems.Cart);
          if (index == 3) _bottomNavigatorBloc.add(NavbarItems.Setting);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.search, color: Colors.orangeAccent),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.favorite, color: Colors.orangeAccent),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.shopping_cart, color: Colors.orangeAccent),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.settings, color: Colors.orangeAccent),
            title: Text("Setting"),
          )
        ],
      ),
    );
  }

  Widget buildBodyPage(NavbarState state) {
    if (state is ShowSearchView) return HomePage();
    if (state is ShowFavoriteView) return HomePage();
    if (state is ShowCartView) return HomePage();
    if (state is ShowSettingView) return HomePage();
  }

  @override
  void dispose() {
    _bottomNavigatorBloc.close();
    super.dispose();
  }
}
