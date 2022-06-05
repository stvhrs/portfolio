import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:portofolio/UI/HomePage.dart';
import 'package:portofolio/UI/MobileHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1000) {
      return HomePage();
    } else {
      log('boile');
      return MobileHome();
    }
  }
}
