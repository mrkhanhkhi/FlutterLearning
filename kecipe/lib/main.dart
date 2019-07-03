import 'package:flutter/material.dart';
import 'package:kecipe/Views/category.dart';
import 'package:kecipe/Views/home_screen.dart';

void main() => runApp(MyApp());

//class Kecipe extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      initialRoute: HomeScreen.id,
//      // routes: {
//      //   WelcomeScreen.id : (context) => WelcomeScreen(),
//      //   LoginScreen.id: (context) => LoginScreen(),
//      //   RegistrationScreen.id: (context) => RegistrationScreen(),
//      //   ChatScreen.id: (context) => ChatScreen(),
//      // },
//      home: MyApp(),
//    );
//  }
//}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kecipe',
//      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: HomeScreen(),
    );
  }
}
