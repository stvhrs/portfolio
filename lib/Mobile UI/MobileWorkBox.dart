import 'package:flutter/material.dart';
import 'package:portofolio/Widget/work_custom_data.dart';

class MobileWork2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        // WorkCustomData(
        //   title: "Sandip Institute Of Engineering & Management Indonesia",
        //   subTitle: "I am currently a Highschool student",
        //   duration: "2016 - Present",
        // ),
        // WorkCustomData(
        //   title: "Flutter + Dart Development Winter Bootcamp",
        //   subTitle:
        //       "The Complete 2020 Flutter + Dart Winter Development Bootcamp at LCO Training Center,\nJaipur, Rajasthan (302017), Covering all the fundamental concepts for Flutter development",
        //   duration: "Dec - 2019 to Feb - 2020",
        // ),
        // WorkCustomData(
        //   title:
        //       "Freelancer - Flutter | Dart Mobile App Developer | UI - UX Designer",
        //   subTitle:
        //       "Flutter Developer and experienced programmer with an extensive history of designing and coding \nsolutions. Skilled in Google’s Flutter/Dart, Firebase App and Web development on a global scale. If you \nare looking for someone that you can trust that will complete your app on time and on budget, then \nplease contact me. I have been developing software for 1+ years and take pride in everything I do.",
        //   duration: "Oct - 2019 to Nov - 2020",
        // ),
        // WorkCustomData(
        //   title: "Mentor at Contributor's Hack, 2020",
        //   subTitle:
        //       "Working as a mentor in HakinCode organization for Flutter CodeAsylums application \n where I can utilize my skills and be an asset to the organization",
        //   duration: "Sep 2020 - Oct 2020",
        // ),
        // WorkCustomData(
        //   title: "Flutter Intern at Mind Sports League | Gurgaon In",
        //   subTitle:
        //       "Building world class Poker Learning platform. Poker Sports League is India’s first poker league is to sportify the game of poker through a unique, team based format",
        //   duration: "Nov - 2020 Present",
        // ),
         WorkCustomData(
          title: "Part-Time Frontend at Orbitallabs.net (IT Consultant)",
          subTitle: "https://orbitallabs.net/",
          duration: "2021 - Present",
        ),
        WorkCustomData(
          title: "Freelance",
          subTitle:
              "I mostly work on student mobile app assignments",
          duration: "2021 to Present",
        ),
      ],
    );
  }
}
