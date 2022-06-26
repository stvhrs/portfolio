import 'package:flutter/material.dart';

class OSImages extends StatelessWidget {
  final String image;
  const OSImages({required this.image});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // color: const Color(0xff64FFDA).withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(2.75),
        child: Image(
          height: size.height * 0.73,
          width: size.width * 0.23,
          fit: BoxFit.fitWidth,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
