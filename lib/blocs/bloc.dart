import 'dart:async';

import 'package:login_bloc/blocs/validators.dart';

class Bloc with Validators {
  final StreamController<String> _emailController = StreamController();
  final StreamController<String> _passwordController = StreamController();

  // Add data to steam
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // close or clean the two controllers
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
