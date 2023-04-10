import 'dart:async';
// import 'dart:async';

class Validator {
  final validateEmail =
      StreamTransformer.fromHandlers(handleData: (String email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Email not valid');
    }
  });

  final validatePass =
      StreamTransformer.fromHandlers(handleData: (String pass, sink) {
    if (pass.length >= 8) {
      sink.add(pass);
    } else {
      sink.addError('Password must contain 8 charecters');
    }
  });
}
