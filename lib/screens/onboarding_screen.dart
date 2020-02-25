import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:project_progress/screens/login_screen.dart';
import 'package:project_progress/utils/constants.dart';
import 'package:project_progress/widgets/finalscreen.dart';

import 'home.dart';

class OnboardingScreen extends StatelessWidget {

  final onboardPages = [
    Container(
      color: Colors.pinkAccent,
      child: Center(
        child: Text('Welcome to Project Progress', style: onboardingText
        ),
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Center(
        child: Text(
            'Track your mood and see changes over time', style: onboardingText
        ),
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text('Write notes for your future self', style: onboardingText
        ),
      ),
    ),
    Container(
      color: Colors.blueAccent,
      child: Center(
        child: Text('Connect with a community of \ndiverse individuals',
            style: onboardingText
        ),
      ),
    ),
    Container(
          child: FinalScreen(),
        )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidSwipe(
          pages: onboardPages,
          fullTransitionValue: 400,
          enableLoop: true,
          enableSlideIcon: false,
          //positionSlideIcon: 0.8,
          waveType: WaveType.liquidReveal,
        )
    );

  }


}

class FinalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 500,),
            Center(
              child: Text(
                'Begin your journey today',
                style: onboardingText,
              ),
            ),
            SizedBox(height: 30,
            ),
            IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_forward_ios
                ),
                iconSize: 40,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()
                  )
                  );
                }
            )
          ],
        ),
    );

  }
}
