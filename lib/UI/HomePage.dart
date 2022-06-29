import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofolio/Model/Method.dart';
import 'package:portofolio/UI/About.dart';
import 'package:portofolio/UI/FeatureProject.dart';
import 'package:portofolio/UI/Work.dart';
import 'package:portofolio/Widget/AppBarTitle.dart';
import 'package:portofolio/Widget/CustomText.dart';
import 'package:portofolio/Widget/MainTiitle.dart';
import 'package:portofolio/Widget/OSImages.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class CustomScrollBehaviour extends MaterialScrollBehavior {
  const CustomScrollBehaviour();

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    switch (getPlatform(context)) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
        return Scrollbar(
          controller: details.controller,
          isAlwaysShown: true,
          child: child,
        );
      case TargetPlatform.windows:
        return Scrollbar(
          controller: details.controller,
          isAlwaysShown: true,
          radius: Radius.zero,
          thickness: 16.0,
          hoverThickness: 16.0,
          showTrackOnHover: true,
          child: child,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return child;
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool get isDesktop =>
      Theme.of(context).platform == TargetPlatform.linux ||
      Theme.of(context).platform == TargetPlatform.macOS ||
      Theme.of(context).platform == TargetPlatform.windows;

  TextStyle? get textStyleBig => Theme.of(context).textTheme.headline5;
  TextStyle? get textStyleMedium => Theme.of(context).textTheme.headline6;
  TextStyle? get textStyleSmall => Theme.of(context).textTheme.bodyText2;
  void toggleAxis() {
    setState(() {
      if (axis == Axis.vertical) {
        axis = Axis.horizontal;
      } else {
        axis = Axis.vertical;
      }
    });
  }

  void toggleCursor() {
    setState(() {
      useSystemCursor = !useSystemCursor;
    });
  }

  Axis axis = Axis.vertical;
  bool useSystemCursor = false;
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  // Controllers

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // print('asdasd');
    // log('g');

    // controller.animateTo(offset, duration: duration, curve: curve)
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: SizedBox(
            height: size.height * 0.14,
            width: size.width,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(children: [
                  Image.asset(
                    'images/logo.png',
                    width: 35,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DefaultTabController(
                        length: 4,
                        child: TabBar(
                          indicatorColor: Colors.transparent,
                          onTap: (index) async {
                            // _scrollToIndex(index);
                            controller.animateTo(0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          tabs: const [
                            Tab(
                              child: AppBarTitle(
                                text: 'About',
                              ),
                            ),
                            Tab(
                              child: AppBarTitle(
                                text: 'Experience',
                              ),
                            ),
                            Tab(
                              child: AppBarTitle(
                                text: 'Project',
                              ),
                            ),
                            Tab(
                              child: AppBarTitle(
                                text: 'Contact Us',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Card(
                      elevation: 4.0,
                      color: const Color(0xff64FFDA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(0.85),
                        height: size.height * 0.07,
                        width: size.height * 0.10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff0A192F),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: InkWell(
                          // hoverColor: const Color(0xFF3E0449),
                         onTap: () {
                            method.launchURL(
                                "https://drive.google.com/file/d/189Irj14oumYb1lTGeYCdJ7Hnwkj4HXjT/view?usp=sharing");
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "CV",
                              style: TextStyle(
                                color: Color(0xff64FFDA),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]))),
        preferredSize: Size.fromHeight(80),
      ),
      backgroundColor: const Color(0xff0A192F),
      body: Column(
        children: [
          //Mavigation Bar

          Row(children: [
            //Social Icon
            SizedBox(
              width: size.width * 0.09,
              height: size.height - 82,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      color: const Color(0xffffa8b2d1),
                      iconSize: 16.0,
                      onPressed: () {
                        method.launchURL("https://github.com/stvhrs");
                      }),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                      color: const Color(0xffffa8b2d1),
                      iconSize: 16.0,
                      onPressed: () {
                        method
                            .launchURL("https://www.instagram.com/stvhrs.dev/");
                      }),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    color: const Color(0xffffa8b2d1),
                    onPressed: () {
                      method.launchURL(
                          "https://www.linkedin.com/in/steve-harris-3891531b3/");
                    },
                    iconSize: 16.0,
                  ),
                  IconButton(
                      icon: const Icon(Icons.call),
                      color: const Color(0xffffa8b2d1),
                      iconSize: 16.0,
                      onPressed: () {
                        method.launchCaller();
                      }),
                  IconButton(
                      icon: const Icon(Icons.mail),
                      color: const Color(0xffffa8b2d1),
                      iconSize: 16.0,
                      onPressed: () {
                        method.launchEmail();
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height: size.height * 0.20,
                      width: 2,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
              height: size.height - 82,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ImprovedScrolling(
                  scrollController: controller,
                  onScroll: (scrollOffset) => debugPrint(
                    'Scroll offset: $scrollOffset',
                  ),
                  onMMBScrollStateChanged: (scrolling) => debugPrint(
                    'Is scrolling: $scrolling',
                  ),
                  onMMBScrollCursorPositionUpdate:
                      (localCursorOffset, scrollActivity) => debugPrint(
                    'Cursor position: $localCursorOffset\n'
                    'Scroll activity: $scrollActivity',
                  ),
                  enableMMBScrolling: true,
                  enableKeyboardScrolling: true,
                  enableCustomMouseWheelScrolling: true,
                  mmbScrollConfig: MMBScrollConfig(
                    customScrollCursor: useSystemCursor
                        ? null
                        : const DefaultCustomScrollCursor(),
                  ),
                  keyboardScrollConfig: KeyboardScrollConfig(
                    arrowsScrollAmount: 250.0,
                    homeScrollDurationBuilder:
                        (currentScrollOffset, minScrollOffset) {
                      return const Duration(milliseconds: 100);
                    },
                    endScrollDurationBuilder:
                        (currentScrollOffset, maxScrollOffset) {
                      return const Duration(milliseconds: 2000);
                    },
                  ),
                  customMouseWheelScrollConfig:
                      const CustomMouseWheelScrollConfig(
                    scrollAmountMultiplier: 2.0,
                  ),
                  child: ScrollConfiguration(
                    behavior: const CustomScrollBehaviour(),
                    child: CustomScrollView(
                      controller: controller,
                      physics: NeverScrollableScrollPhysics(),
                      slivers: <Widget>[
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * .06,
                              ),
                              const CustomText(
                                text: "Hi, my name is",
                                textsize: 16.0,
                                color: Color(0xff41FBDA),
                                letterSpacing: 3.0,
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              const CustomText(
                                text: "Steve Harris.",
                                textsize: 68.0,
                                color: Color(0xffCCD6F6),
                                fontWeight: FontWeight.w900,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              CustomText(
                                text:
                                    "I build things that related to Frontend & Backend",
                                textsize: 56.0,
                                color: const Color(0xffCCD6F6).withOpacity(0.6),
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: size.height * .04,
                              ),
                              Wrap(
                                children: const [
                                  Text(
                                    "I'm a freelancer based in Indonesia, specializing in \nbuilding mobile apps, and the backend services \napplications, and everything in between.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                      letterSpacing: 2.75,
                                      wordSpacing: 0.75,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * .12,
                              ),

                              //get in tuch text
                              InkWell(
                                onTap: () {
                                  method.launchEmail();
                                },
                                hoverColor:
                                    const Color(0xff64FFDA).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.09,
                                  width: size.width * 0.14,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff64FFDA),
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: const Text(
                                    "Get In Touch",
                                    style: TextStyle(
                                      color: Color(0xff64FFDA),
                                      letterSpacing: 2.75,
                                      wordSpacing: 1.0,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: size.height * 0.20,
                              ),
                            ],
                          ),

                          //About Me
                          _wrapScrollTag(
                            index: 0,
                            child: About(),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),

                          //Where I've Worked
                          _wrapScrollTag(index: 1, child: Work()),
                          SizedBox(
                            height: size.height * 0.10,
                          ),

                          //Some Things I've Built Main Project
                          Column(
                            children: [
                              MainTiitle(
                                number: "0.3",
                                text: "Achivements",
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              FeatureProject(
                                imagePath: "images/idt.png",
                                ontab: () {
                                  method.launchURL(
                                      "https://github.com/stvhrs/technokingdiesel");
                                },
                                projectDesc:
                                    "IDT is a Digital Business competition held by the government, attended by ministers and Jokowi, I thought it was a Digital Product competition, and then we realized that we didn't prepare for it, so i didnt code, just deploy a website that has some moving png wireframe lmao :), but it's pretty fun though  ",
                                projectTitle: "Top 20 Teams IDT Hackathon",
                                tech1: "",
                                tech2: "",
                                tech3: "",
                              ),
                            ],
                          ),
                          _wrapScrollTag(
                              index: 2,
                              child: Column(
                                children: [
                                  const MainTiitle(
                                    number: "0.4",
                                    text: "Some Things I've Built",
                                  ),
                                  SizedBox(
                                    height: size.height * 0.04,
                                  ),
                                  FeatureProject(
                                    imagePath: "images/c1.gif",
                                    ontab: () {
                                      method.launchURL(
                                          "https://github.com/stvhrs/technokingdiesel");
                                    },
                                    projectDesc:
                                        "During pandemic i made presence app for my school",
                                    projectTitle: "Absensi Smanig",
                                    tech1: "FireStore",
                                    tech2: "Flutter",
                                    tech3: "Shared Preference",
                                  ),
                                  FeatureProject(
                                    imagePath: "images/c2.gif",
                                    ontab: () {
                                      method.launchURL(
                                          "https://github.com/stvhrs/technokingdiesel");
                                    },
                                    projectDesc:
                                        "My teacher ask me to made him a Simple Voting app for SRAGEN MGMP members",
                                    projectTitle: "Voting MGMP",
                                    tech1: "Dart",
                                    tech2: "Flutter",
                                    tech3: "Firestore",
                                  ),
                                  FeatureProject(
                                    imagePath: "images/c3.gif",
                                    ontab: () {
                                      method.launchURL(
                                          "https://github.com/stvhrs/technokingdiesel");
                                    },
                                    projectDesc:
                                        "Diesel engine workkshop local database Desktop application, the database is exportable to excel file",
                                    projectTitle: "TechnoKingDiesel",
                                    tech1: "Excel",
                                    tech2: "Flutter",
                                    tech3: "Shared Preference",
                                  ),
                                  FeatureProject(
                                    imagePath: "images/c4.gif",
                                    ontab: () {
                                      method.launchURL(
                                          "https://github.com/stvhrs/technokingdiesel");
                                    },
                                    projectDesc:
                                        "Collage student ask me to do her Flutter final assigenment, this porject shows that the student able to understand widgets and Provider State Management",
                                    projectTitle: "Flutter assigenment",
                                    tech1: "Dart",
                                    tech2: "Flutter",
                                    tech3: "Provider",
                                  ),
                                  FeatureProject(
                                    imagePath: "images/c1.png",
                                    ontab: () {
                                      method.launchURL(
                                          "https://github.com/stvhrs/technokingdiesel");
                                    },
                                    projectDesc:
                                        "I helped my friend to do his thesis, by making an application that monitors the power of his IoT device",
                                    projectTitle: "PowerMonitoring",
                                    tech1: "Dart",
                                    tech2: "Flutter",
                                    tech3: "Realtime Database",
                                  ),
                                ],
                              )),

                          const SizedBox(
                            height: 6.0,
                          ),

                          _wrapScrollTag(
                            index: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.68,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: "0.4 What's Next?",
                                        textsize: 16.0,
                                        color: Color(0xff41FBDA),
                                        letterSpacing: 3.0,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      const CustomText(
                                        text: "Get In Touch",
                                        textsize: 42.0,
                                        color: Colors.white,
                                        letterSpacing: 3.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      Wrap(
                                        children: [
                                          Text(
                                            " I'm currently looking for freelance project, my inbox is \nalways open. Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              letterSpacing: 0.75,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32.0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          method.launchURL(
                                              'https://www.instagram.com/stvhrs.dev/');
                                        },
                                        child: Card(
                                          elevation: 4.0,
                                          color: const Color(0xff64FFDA),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.all(0.85),
                                            height: size.height * 0.09,
                                            width: size.width * 0.10,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff0A192F),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                              ),
                                              child: Text(
                                                "Say Hello",
                                                style: TextStyle(
                                                  color: Color(0xff64FFDA),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //Footer
                                Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  //color: Colors.white,
                                  child: Text(
                                    "Designed & Built by Steve Harris 💙 Flutter",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      letterSpacing: 1.75,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                      ],
                    ),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.height - 82,
              //color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RotatedBox(
                    quarterTurns: 45,
                    child: Text(
                      "steve.harris250105@gmail.com",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height: 100,
                      width: 2,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
      // ...List.generate(100, (index) => CircleAvatar())
    );
  }
}
