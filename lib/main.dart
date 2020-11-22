import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/sandbox.dart';
import './screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paradise Trips',
      home: Home(),
    );
  }
}
