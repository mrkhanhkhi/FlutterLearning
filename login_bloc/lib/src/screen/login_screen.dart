import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0),),
            submitButton()
          ],
        ),
      ),
    );
  }
}

Widget emailField() {
  return TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'you@example.com',
      labelText: 'Email Address',
      errorText: 'Invalid email',
    ),
  );
}

Widget passwordField() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Password',
      labelText: 'Password',
    ),
    obscureText: true,
  );
}

Widget submitButton() {
  return RaisedButton(
    child: Text('Login'),
    color: Colors.blue,
    onPressed: () {},
  );
}