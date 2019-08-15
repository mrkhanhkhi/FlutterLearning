import 'package:flutter/material.dart';
import 'src/screen/login_screen.dart';
import 'src/blocs/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
          title: 'Flutter Demo',
          home: Scaffold(
            body: LoginScreen(),
            )
          ),
    );
  }
}
