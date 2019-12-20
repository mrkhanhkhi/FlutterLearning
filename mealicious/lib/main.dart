import 'package:flutter/material.dart';
import 'package:mealicious/ui/bottom_navigator/bottom_navigator_bar.dart';
import 'package:mealicious/injection_container.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          accentColor: Colors.red.shade400,
        ),
        home: BottomNavigatorBar());
  }
}
