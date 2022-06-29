import 'package:flutter/material.dart';

class WorkCustomData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String duration;

  const WorkCustomData(
      {required this.title, required this.subTitle, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:12.0,bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 19.0,
              color: Color(0xffCCD6F6),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 13.0,
              color: const Color(0xffCCD6F6).withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            duration,
            style: TextStyle(
              fontSize: 12.0,
              color: const Color(0xffCCD6F6).withOpacity(0.5),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}