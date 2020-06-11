import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_progress/screens/home_screen.dart';
import 'package:project_progress/screens/onboarding_screen.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  getCurrentUser() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else {
          if (snapshot.data != null) {
            return HomeScreen();
          }
          else {
            return OnboardingScreen();
          }
        }
      },
    );
  }
}