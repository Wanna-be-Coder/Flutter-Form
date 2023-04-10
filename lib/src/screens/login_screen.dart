import 'package:flutter/material.dart';
import '../mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixins {
  final formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  String emailValue = "";
  String passwordValue = "";

  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(100),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            password(),
            Container(margin: const EdgeInsets.only(bottom: 25)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email:',
        hintText: 'youremail@company.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (dynamic value) => {emailValue = value},
    );
  }

  Widget password() {
    return TextFormField(
      obscureText: !passwordVisible,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        labelText: 'Password:',
        hintText: '********',
        suffixIcon: IconButton(
          icon:
              Icon(!passwordVisible ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() {
            passwordVisible = !passwordVisible;
          }),
        ),
      ),
      validator: validatorPassword,
      onSaved: (dynamic value) => {passwordValue = value},
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () => {
        if (formKey.currentState?.validate() != null &&
            formKey.currentState?.validate() != false)
          {
            print(formKey.currentState?.validate()),
            formKey.currentState?.save(),
            print('Current User $emailValue and his pass $passwordValue')
          }
      },
      child: Text('Submit'),
    );
  }
}
