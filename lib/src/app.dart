import 'package:flutter/material.dart';
import 'package:form_validation/src/screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return Provider(
      child: const MaterialApp(
        title: "Form validation",
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
