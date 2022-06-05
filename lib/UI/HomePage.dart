import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
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
                                _scrollToIndex(index);
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
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: FlatButton(
                              hoverColor: const Color(0xFF3E0449),
                              onPressed: () {
                                method.launchURL(
                                    "https://drive.google.com/file/d/10YB1psAPcKg2j6lwsgs2njWXZreGui3D/view?usp=sharing");
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Resume",
                                  style: TextStyle(
                                    color: Color(0xff64FFDA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
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
                              method.launchURL(
                                  "https://www.instagram.com/stvhrs.dev/");
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
                        child: CustomScrollView(
                          controller: _autoScrollController,
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
                                        "I build things for the Android and web.",
                                    textsize: 56.0,
                                    color: const Color(0xffCCD6F6)
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: size.height * .04,
                                  ),
                                  Wrap(
                                    children: const [
                                      Text(
                                        "I'm a freelancer based in Indonesia, IN specializing in \nbuilding (and occasionally designing) exceptional websites, \napplications, and everything in between.",
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
                                    hoverColor: const Color(0xff64FFDA)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.09,
                                      width: size.width * 0.14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xff64FFDA),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
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
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      const MainTiitle(
                                        number: "0.3",
                                        text: "Some Things I've Built",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      // FeatureProject(
                                      //   imagePath: "images/pic9.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/WhatsApp--UI-Clone");
                                      //   },
                                      //   projectDesc:
                                      //       "A Mobile app for both Android and IOS. View your Status, Chat, and call history. The purpose of this projcet is to Learn Flutter complex UI Design.",
                                      //   projectTitle: "WhatsaApp UI Clone",
                                      //   tech1: "Flutter",
                                      //   tech2: "Dart",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic2.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-Blog-App-using-Firebase");
                                      //   },
                                      //   projectDesc:
                                      //       "A blog application using Flutter and firebase, In this project implement Firebase CURD operation, User can add post as well see all the post.",
                                      //   projectTitle: "Blog Application",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Firebase",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic3.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Wallpaper-Hub-using-Flutter");
                                      //   },
                                      //   projectDesc:
                                      //       "A Wallpaper application Using Pixel API, to show more than 5k+ images. User can Search any images, as well as Download and directly set Image as Wallpaper.",
                                      //   projectTitle: "Wallpaper Hub",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic4.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/coronavirus-tracker-app");
                                      //   },
                                      //   projectDesc:
                                      //       "A Flutter app to track Coronavirus outbreak, Current statistics of global total confirmed, deaths, recovered cases, Health news, coronavirus safety information and many more.",
                                      //   projectTitle: "Covid19 Tracker",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),
                                      // //ff
                                      // FeatureProject(
                                      //   imagePath: "images/pic5.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Gender-Predictor-Flutter-App");
                                      //   },
                                      //   projectDesc:
                                      //       "In this app you can predict the gender with the help of name and probability of that name.",
                                      //   projectTitle: "Gender Predictor",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic6.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/News-Hours-Apps-Using-Rest-API");
                                      //   },
                                      //   projectDesc:
                                      //       "complete news Application using rest API API link- https://newsapi.org, you can get all news.",
                                      //   projectTitle: "News Hour",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic7.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-wallpaper-App-using-Firebase");
                                      //   },
                                      //   projectDesc:
                                      //       "Flutter Wallpaper application using firebase as a backend with a cool animation, it show the all images that are store in firebase firestore.",
                                      //   projectTitle: "Wallpaper App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Firebase",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic8.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-Weather-Application");
                                      //   },
                                      //   projectDesc:
                                      //       "Weather app. This weather app is one of best free weather apps with full features: Local weather, weather map (weather map service) and weather widgets. Widgets for Android: The weather radar widget free and clock widget weather with beautiful style.",
                                      //   projectTitle: "Weather Application",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic10.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://pub.dev/packages/flutter_onboarding_screen");
                                      //   },
                                      //   projectDesc:
                                      //       "A flutter package which help developer in creating a onboarding screens of their app.",
                                      //   projectTitle:
                                      //       "Flutter Onboarding Screen Package",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Dart Package",
                                      // ),

                                      FeatureProject(
                                        imagePath: "images/p1.png",
                                        ontab: () {
                                          method.launchURL(
                                              "https://github.com/stvhrs/technokingdiesel");
                                        },
                                        projectDesc:
                                            "Diesel engine worksshop local database Desktop application",
                                        projectTitle: "TechnoKingDiesel",
                                        tech1: "Dart",
                                        tech2: "Flutter",
                                        tech3: "Shared Preference",
                                      ),

                                      const MainTiitle(
                                        number: "0.4",
                                        text: "Open Source Project",
                                      ),

                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),

                                      //other Projects
                                      SizedBox(
                                        height: size.height * 0.86,
                                        width: size.width - 100,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                OSImages(
                                                  image: "images/c1.png",
                                                ),
                                                OSImages(
                                                  image: "images/c1.png",
                                                ),
                                                // OSImages(
                                                //   image: "images/c1.png",
                                                // ), OSImages(
                                                //   image: "images/c1.png",
                                                // ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * 0.04,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CustomText(
                                                  text: "Power Monitoring",
                                                  textsize: 16.0,
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1.75,
                                                ),  CustomText(
                                                  text: "Power Monitoring",
                                                  textsize: 16.0,
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1.75,
                                                ),
                                                // CustomText(
                                                //   text: "Chat App",
                                                //   textsize: 16.0,
                                                //   color: Colors.white
                                                //       .withOpacity(0.4),
                                                //   fontWeight: FontWeight.w700,
                                                //   letterSpacing: 1.75,
                                                // ),
                                                // CustomText(
                                                //   text: "Spotify Clone",
                                                //   textsize: 16.0,
                                                //   color: Colors.white
                                                //       .withOpacity(0.4),
                                                //   fontWeight: FontWeight.w700,
                                                //   letterSpacing: 1.75,
                                                // ),
                                                // CustomText(
                                                //   text: "TODO App",
                                                //   textsize: 16.0,
                                                //   color: Colors.white
                                                //       .withOpacity(0.4),
                                                //   fontWeight: FontWeight.w700,
                                                //   letterSpacing: 1.75,
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      //other Projects
                                      // SizedBox(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "images/pic114.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic115.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic116.jfif",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic117.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Spannish Audio",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Drumpad",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Currency Converter",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Calculator",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // //other Projects
                                      // SizedBox(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "images/pic118.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic119.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic120.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic121.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Prime Videos UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Tic Tac Toe Game",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Currency Converter UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Love Calculator",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic102.gif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-Web-SolMusic-Landing-Page");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "SolMusic",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Web",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic104.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-UI-Kit");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Sign Up and Sign In",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic105.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-UI-Kit");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Sign up and Sign in",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic106.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flowers-Shop-Mobile-App-Store");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Online Flowers Shop",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic107.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Food-Delivery-App-UI");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Food delivery App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic108.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-Plant-Shop-UI-Design");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Plant Nursery App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic109.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Foody-App-UI-Design");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Foody",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic110.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Flutter-Online-Food-Order-App-UI");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Online Food order",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic501.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Ganpati-Bappa-");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Ganpati Bappa",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter Animation",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic506.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/stvhrs/Netflix-Web-Clone-Using-Flutter");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Flutter Netflix Web",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter Wen",
                                      //   tech3: "Flutter UI",
                                      // ),
                                    ],
                                  )),

                              const SizedBox(
                                height: 6.0,
                              ),

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.68,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      // color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  color: Colors.white
                                                      .withOpacity(0.4),
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
                                              method.launchURL('https://www.instagram.com/stvhrs.dev/');
                                            },
                                            child: Card(
                                              elevation: 4.0,
                                              color: const Color(0xff64FFDA),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.all(0.85),
                                                height: size.height * 0.09,
                                                width: size.width * 0.10,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff0A192F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
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
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width -
                                          100,
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
                ],
              ),
            ],
          ),
        ));
  }
}
