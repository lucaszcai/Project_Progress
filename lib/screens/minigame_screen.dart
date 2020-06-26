import 'package:flutter/material.dart';

class MinigameScreen extends StatefulWidget {
  MinigameScreen({Key key}) : super(key: key);

  @override
  _MinigameScreenState createState() => _MinigameScreenState();
}

class _MinigameScreenState extends State<MinigameScreen> {
  int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play a Game!'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width / 3,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            color: Color.fromRGBO(0, 0, counter, 1),
            child: Center(
              child: Text(
                counter.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
