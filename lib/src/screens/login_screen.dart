import 'package:flutter/material.dart';
// import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            submitButton(),
          ],
        ));
  }

  Widget emailField(bloc) {
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

  Widget passwordField(bloc) {
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
