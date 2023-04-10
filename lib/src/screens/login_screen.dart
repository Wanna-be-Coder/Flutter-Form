import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ));
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            hintText: 'your@company.com',
            labelText: 'Email:',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: bloc.pass,
        builder: (context, snapshopt) {
          return TextField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: bloc.changePass,
            decoration: InputDecoration(
              hintText: '********',
              labelText: 'Password:',
              errorText: snapshopt.error?.toString(),
            ),
          );
        });
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Login'),
    );
  }
}
