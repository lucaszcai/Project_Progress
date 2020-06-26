import 'package:flutter/material.dart';

class MinigameScreen extends StatefulWidget {
  MinigameScreen({Key key}) : super(key: key);

  @override
  _MinigameScreenState createState() => _MinigameScreenState();
}

class _MinigameScreenState extends State<MinigameScreen> {
  int counter;
  int index;
  Color color;

  @override
  void initState() {
    color = Color.fromRGBO(0, 0, 0, 1);
    counter = 0;
    index = 0;
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
                if (counter > 250) {
                  counter = 0;
                  if (index != 2) {
                    index++;
                  }
                  else {
                    index = 0;
                  }
                }
                else {
                  counter+= 5;
                }
                if (index == 0) {
                  color = Color.fromRGBO(counter, 0, 0, 1);
                }
                else if (index == 1) {
                  color = Color.fromRGBO(0, counter, 0, 1);
                }
                else {
                  color = Color.fromRGBO(0, 0, counter, 1);
                }
              });
            },
            color: color,
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
