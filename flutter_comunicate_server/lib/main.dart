// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web API',
      routes: {
        '/': (context) => Home(),
        // '/details': (context) => Details(),
        // '/create': (context) => Create(),
        // '/edit': (context) => Edit(),
      },
    );
  }
}