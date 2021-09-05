import 'package:flutter/material.dart';
import 'package:tictactoe/page/home.dart';
import 'package:tictactoe/page/page3.dart';
import 'package:tictactoe/page/page5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
        routes: {
          '/Page3': (context) => Page3(),
          '/Page5': (context) => Page5(),
        });
  }
}
