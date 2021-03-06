import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:youtube_search/ui/bottom_navigator/bloc/navbar_bloc.dart';
import 'package:youtube_search/ui/bottom_navigator/bloc/navbar_event.dart';
import 'package:youtube_search/ui/bottom_navigator/bloc/navbar_state.dart';
import 'package:youtube_search/ui/search/search_page.dart';

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
        backgroundColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) _bottomNavigatorBloc.dispatch(NavbarItems.Search);
          if (index == 1) _bottomNavigatorBloc.dispatch(NavbarItems.Favorite);
          if (index == 2) _bottomNavigatorBloc.dispatch(NavbarItems.Cart);
          if (index == 3) _bottomNavigatorBloc.dispatch(NavbarItems.Setting);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.settings),
            title: Text("Setting"),
          )
        ],
      ),
    );
  }

  Widget buildBodyPage(NavbarState state) {
    if (state is ShowSearchView) return SearchPage();
    if (state is ShowFavoriteView) return SearchPage();
    if (state is ShowCartView) return SearchPage();
    if (state is ShowSettingView) return SearchPage();
  }

  @override
  void dispose() {
    _bottomNavigatorBloc.dispose();
    super.dispose();
  }
}
