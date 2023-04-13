import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  get changeEmail => _emailController.sink.add;
  get email => _emailController.stream.transform(validateEmail);

  get changePass => _passwordController.sink.add;
  get pass => _passwordController.stream.transform(validatePass);

  submit() {
    final validEmail = _emailController.value;
    final validPass = _passwordController.value;

    print('User email is $validateEmail and password is $validatePass');
  }

  //Validation stram

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, pass, (e, p) => true);

  dipose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
