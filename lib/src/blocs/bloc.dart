import 'dart:async';
import 'validator.dart';

class Bloc with Validator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  get changeEmail => _emailController.sink.add;
  get email => _emailController.stream.transform(validateEmail);

  get changePass => _passwordController.sink.add;
  get pass => _passwordController.stream.transform(validatePass);

  dipose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
