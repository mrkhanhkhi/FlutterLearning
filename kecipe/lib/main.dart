import 'package:flutter/material.dart';
import 'package:kecipe/Views/home_screen.dart';

void main() => runApp(Kecipe());

class Kecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      // routes: {
      //   WelcomeScreen.id : (context) => WelcomeScreen(),
      //   LoginScreen.id: (context) => LoginScreen(),
      //   RegistrationScreen.id: (context) => RegistrationScreen(),
      //   ChatScreen.id: (context) => ChatScreen(),
      // },
      home: HomeScreen(),
    );
  }
}
