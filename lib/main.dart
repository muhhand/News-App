import 'package:flutter/material.dart';
import 'package:news_app2/onboarding.dart';
import 'package:news_app2/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsToday',
      home: OnBoardingScreen(),
    );
  }
}
