import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(100),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            password(),
            Container(margin: EdgeInsets.only(bottom: 25)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email:',
        hintText: 'youremail@company.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (dynamic value) {
        if (!value.contains("@")) {
          return "Email not valid";
        }
      },
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
      validator: (dynamic value) {
        if (value.length < 8) {
          return "Password not valid";
        }
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () => {print(formKey.currentState?.validate())},
      child: Text('Submit'),
    );
  }
}
