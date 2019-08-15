import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';


class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25.0),),
            submitButton(bloc)
          ],
        ),
      ),
    );
  }
}

Widget emailField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'you@example.com',
          labelText: 'Email Address',
          errorText: snapshot.error,
        ),
      );
    }
  );
}

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changePassword,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
        ),
        obscureText: true,
      );
    }
  );
}

Widget submitButton(Bloc bloc) {
  return StreamBuilder<Object>(
    stream: bloc.submitValue,
    builder: (context, snapshot) {
      return RaisedButton(
        child: Text('Login'),
        color: Colors.blue,
        onPressed: snapshot.hasData ? () {
          print('Hello');
        } : null,
      );
    }
  );
}