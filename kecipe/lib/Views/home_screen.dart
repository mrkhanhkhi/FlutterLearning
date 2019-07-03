import 'package:flutter/material.dart';
import 'package:kecipe/Views/category.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _page = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Category(),
          Category(),
          Category(),
          Category(),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width:7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color: _page == 0
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(0),
            ),

            IconButton(
              icon:Icon(
                Icons.favorite,
                size: 24.0,
              ),
              color: _page == 1
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(1),
            ),

            IconButton(
              icon: Icon(
                Icons.mode_comment,
                size: 24.0,
              ),
              color: _page == 2
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(2),
            ),

            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color: _page == 3
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(3),
            ),

            SizedBox(width:7),
          ],
        ),
        color: Theme.of(context).primaryColor,

      ),
    );
  }
}