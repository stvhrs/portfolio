import 'dart:developer';

import 'package:flutter/material.dart';

class MobileProject extends StatelessWidget {
  final Function ontab;
  final String image;

  const MobileProject({required this.ontab, required this.image});

  @override
  Widget build(BuildContext context) {
    log('build');
    return Center(
      child: GestureDetector(
        onTap: () {
          // ontab();
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(image),
              ),
            ),const Divider(color:Color(0xff303C55),indent: 70,endIndent: 80,)
          ],
        ),
      ),
    );
  }
}
