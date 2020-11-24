import 'package:flutter/material.dart';
import './healthy_fruits/views/screens/fruits_home.dart';
import './ninja_trips/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      home: FruitsHome(),
    );
  }
}
