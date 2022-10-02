import 'package:flutter/material.dart';
import 'package:flutter_restapi/example_four.dart';
import 'package:flutter_restapi/example_three.dart';
import 'package:flutter_restapi/example_two.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleFour(),
    );
  }
}
