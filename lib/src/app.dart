import 'package:flutter/material.dart';
import 'package:form_validation/src/screens/login_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: "Form validation",
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
