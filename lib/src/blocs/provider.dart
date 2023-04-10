import 'bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({super.key, required super.child});

  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
