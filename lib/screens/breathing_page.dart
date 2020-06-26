import 'package:flutter/material.dart';

class BreathingPage extends StatefulWidget {
  BreathingPage({Key key, this.uid}) : super(key: key);
  final String uid;

  @override
  _BreathingPageState createState() => _BreathingPageState();
}

class _BreathingPageState extends State<BreathingPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _sizeAnimation;

  bool reverse = false;

  int time;

  @override
  void initState() {
    time = 0;
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController..duration = Duration(seconds: 7);
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController..duration = Duration(seconds: 4);
          _animationController.forward();
        }
      })
      ..addListener(() {
        if (_sizeAnimation.value.floor() != time) {
          setState(() {
            time = _sizeAnimation.value.ceil();
          });
        }
      });

    _sizeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _sizeAnimation.addListener(() {
      print(_animationController.duration);
      Duration duration = _animationController.duration * _sizeAnimation.value;
      if (duration.inSeconds != time)
      setState(() {
        time = duration.inSeconds;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedBuilder(
              animation: _sizeAnimation,
              builder: (BuildContext context, child) {
                return IconButton(
                  onPressed: () {
                    if (_animationController.status ==
                        AnimationStatus.dismissed) {
                      _animationController.forward();
                    }
                  },
                  icon: Icon(Icons.favorite),
                  iconSize: _sizeAnimation.value * 100 + 40,
                  color: Colors.red,
                );
              },
            ),
            Text(
              time.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

}
