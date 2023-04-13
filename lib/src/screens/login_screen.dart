import 'package:flutter/material.dart';
// import 'package:form_validation/src/blocs/bloc.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            emailField(bloc),
            passwordField(bloc),
            Container(
              margin: const EdgeInsets.only(top: 20),
            ),
            submitButton(bloc),
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

  Widget submitButton(Bloc blocs) {
    return StreamBuilder(
        stream: blocs.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: !snapshot.hasData ? null : blocs.submit,
            child: const Text('Login'),
          );
        });
  }
}
