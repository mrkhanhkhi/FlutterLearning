import 'package:flutter/material.dart';
import 'package:kecipe/Views/category.dart';
import 'package:kecipe/Views/home_screen.dart';
import 'package:kecipe/common/constant.dart';
import 'package:kecipe/Views/recipe_list.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:kecipe/services/global_bloc.dart';
import 'package:kecipe/services/meal_favorite_bloc.dart';
import 'package:provider/provider.dart';
import 'package:kecipe/services/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalBloc>(
      child:   MaterialApp(
        title: 'Flutter Shopping Cart Demo',
        theme: isDark ? Constants.darkTheme : Constants.lightTheme,
        home: HomeScreen(),
        ), bloc: GlobalBloc(),
      );
  }
}
