import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofolio/Widget/MobileWorkBox.dart';
import 'package:portofolio/Widget/Workbox.dart';

class MobileWork extends StatefulWidget {
  @override
  _MobileWorkState createState() => _MobileWorkState();
}

class _MobileWorkState extends State<MobileWork> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height *0.7 ,
      ),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                    height: size.height * 0.6,
                    //color: Colors.indigo,
                    child: Stack(
                      children: [
                        const Center(
                          child: VerticalDivider(
                            color: Color(0xff64FFDA),
                            thickness: 1.75,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.pink,
                                child: FaIcon(FontAwesomeIcons.laptopHouse,
                                    color: Colors.white),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                child: FaIcon(FontAwesomeIcons.freeCodeCamp,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                        )
                      ],
                    )),
              ),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: size.height * 0.5,
                    child: MobileWork2(),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
