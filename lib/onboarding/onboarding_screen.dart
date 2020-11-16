import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:myflutter/login.dart';
import 'package:nice_intro/intro_screen.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:nice_intro/intro_screens.dart';
class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
      onSkip: () => print('Skipping the intro slides'),
      footerBgColor: Color(0xFFf79790),
      activeDotColor: Colors.white,
      footerRadius: 18.0,
//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Search',
          header: Lottie.asset('assets/lottie/scan.json'),
          description: 'Quickly find all your messages',
          headerBgColor: Colors.white,
        ),
        IntroScreen(
          title: 'Focused Inbox',
          header: Lottie.asset('assets/lottie/b.json'),
          headerBgColor: Colors.white,
          description: "We've put your most important, actionable emails here",
        ),
        IntroScreen(
          title: 'Social',
          headerBgColor: Colors.white,
          header: Lottie.asset('assets/lottie/c.json'),
          description: "Keep talking with your mates",
        ),
      ],
    );

    return Scaffold(
      body: screens,
    );
  }
}


