import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';

class Bloc extends Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

      // Add data to stream

  Function(String) get email => _emailController.sink.add;
  Function(String) get password => _passwordController.sink.add;

      // Retrieve data from stream
  get changeEmail => _emailController.stream.transform(validateEmail);
  get changePassword => _passwordController.stream.transform(validatePassword);



  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}