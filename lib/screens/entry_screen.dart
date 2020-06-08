import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EntryScreen extends StatefulWidget {
  EntryScreen({Key key, this.uid}) : super(key: key);
  final String uid;

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  double hoursSlept = 5;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text(
            'Choose how you feel today',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          SleekCircularSlider(
            appearance: CircularSliderAppearance(
              startAngle: 0,
              angleRange: 360,
              customColors: CustomSliderColors(
                progressBarColors: [
                  Colors.white,
                  Colors.blue,
                  Colors.blue[900],
                ],
              ),
              size: 250,
            ),
            initialValue: 0,
            min: 0,
            max: 12,
            onChange: (value) {
              print(value);
            },
          ),
//          Container(
//            height: MediaQuery.of(context).size.height / 7,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                Expanded(
//                  child: ListView(
//                    scrollDirection: Axis.horizontal,
//                    children: <Widget>[
//                      SizedBox(width: 10,),
//                      GestureDetector(
//                        child: Container(
//                          height: MediaQuery.of(context).size.height / 8,
//                          width: MediaQuery.of(context).size.width / 4,
//                          decoration: BoxDecoration(
//                            color: Colors.blue,
//                            borderRadius: BorderRadius.circular(15),
//                          ),
//                          child: Center(child: Text('1')),
//                        ),
//                        onTap: () {
//                          print(1);
//                        },
//                      ),
//                      SizedBox(width: 10,),
//                      GestureDetector(
//                        child: Container(
//                          height: MediaQuery.of(context).size.height / 8,
//                          width: MediaQuery.of(context).size.width / 4,
//                          decoration: BoxDecoration(
//                            color: Colors.blue,
//                            borderRadius: BorderRadius.circular(15),
//                          ),
//                          child: Center(child: Text('2')),
//                        ),
//                        onTap: () {
//                          print(1);
//                        },
//                      ),
//                      SizedBox(width: 10,),
//                      GestureDetector(
//                        child: Container(
//                          height: MediaQuery.of(context).size.height / 8,
//                          width: MediaQuery.of(context).size.width / 4,
//                          decoration: BoxDecoration(
//                            color: Colors.blue,
//                            borderRadius: BorderRadius.circular(15),
//                          ),
//                          child: Center(child: Text('3')),
//                        ),
//                        onTap: () {
//                          print(1);
//                        },
//                      ),
//                      SizedBox(width: 10,),
//                      GestureDetector(
//                        child: Container(
//                          height: MediaQuery.of(context).size.height / 8,
//                          width: MediaQuery.of(context).size.width / 4,
//                          decoration: BoxDecoration(
//                            color: Colors.blue,
//                            borderRadius: BorderRadius.circular(15),
//                          ),
//                          child: Center(child: Text('4')),
//                        ),
//                        onTap: () {
//                          print(1);
//                        },
//                      ),
//                      SizedBox(width: 10,),
//                      GestureDetector(
//                        child: Container(
//                          height: MediaQuery.of(context).size.height / 8,
//                          width: MediaQuery.of(context).size.width / 4,
//                          decoration: BoxDecoration(
//                            color: Colors.blue,
//                            borderRadius: BorderRadius.circular(15),
//                          ),
//                          child: Center(child: Text('5')),
//                        ),
//                        onTap: () {
//                          print(1);
//                        },
//                      ),
//                      SizedBox(width: 10,),
//                    ],
//                  ),
//                )
//              ],
//            ),
//          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'What did you do today?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 6),
                    child: GridView.count(
                      primary: false,
                      shrinkWrap: false,
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: <Widget>[
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.business_center),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.directions_bike),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.favorite),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.local_offer),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.supervisor_account),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.create),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.mood),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.lightbulb_outline),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            print("pressed");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/illustrations/activities.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
