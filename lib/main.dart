import 'package:flutter/material.dart';
import 'package:portofolio/UI/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steve Harris',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
