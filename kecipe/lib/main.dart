import 'package:flutter/material.dart';
import 'package:kecipe/Views/category.dart';
import 'package:kecipe/Views/home_screen.dart';
import 'package:kecipe/common/constant.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kecipe',
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: HomeScreen(),
    );
  }
}
