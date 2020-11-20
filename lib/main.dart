import 'package:flutter/material.dart';
import 'package:myflutter/login.dart';
import 'package:myflutter/pages/home.dart';
import 'package:myflutter/pages/product.dart';
import 'package:myflutter/profile.dart';
import 'package:myflutter/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding/onboarding_screen.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "product",
      routes: {
        'register': (context) => Register(),
        'login': (context) => Login(),
        "first": (context) => OnBoardingScreen(),
        "home": (context) => Home(),
        "profile": (context) => ProfilePage(),
        "product": (context) => Product(),
      },
      home: OnBoardingScreen(),
    );
  }
}
