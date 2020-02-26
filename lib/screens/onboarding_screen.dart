import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:project_progress/screens/login_screen.dart';
import 'package:project_progress/utils/constants.dart';

import 'home.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {



  _goToLogin(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: skipButton(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/onboarding/onboarding0.png'),),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Text('Track your mood and', style: onboardingText),
                                Text('see changes over time', style: onboardingText),
                              ] ,
                            )
                        ),
                      ),
                    ]
                )
            )
        ),
      ),
      Container(
        color: Colors.greenAccent,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: skipButton(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/onboarding/onboarding1.png'),),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Write notes for your future self', style: onboardingText),
                          ),
                        ),
                      ),
                    ]
                )
            )
        ),
      ),
      Container(
        color: Colors.blueAccent,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerRight,
                          child: skipButton(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image: AssetImage('assets/onboarding/onboarding2.png'),),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              children: <Widget>[
                                Text('Connect with a community of', style: onboardingText),
                                Text('diverse individuals', style: onboardingText),
                              ]
                          ),
                        ),
                      ),
                    ]
                )
            )
        ),
      ),
      Container(
        child: FinalScreen(),
      )
    ];

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

  Widget skipButton(BuildContext context){
    return FlatButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())),
      child: Text(
        'Skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }


}


class FinalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orangeAccent,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
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
        ),
    );

  }



  /*
  Widget<C> _createSkipButton(
      return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
        onPressed: () => print('Skip'),
        child: Text(
        'Skip',
        style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        ),
        ),
        ),
        ),
      )*/
}
