import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_progress/screens/home_screen.dart';
import 'package:project_progress/screens/onboarding_screen.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Progress',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
    );
  }
}

