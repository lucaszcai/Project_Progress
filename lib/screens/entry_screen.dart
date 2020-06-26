import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:project_progress/models/Entry.dart';
import 'package:project_progress/widgets/customslider_widget.dart';
import 'package:project_progress/widgets/customsliderthumbcircle.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:project_progress/utils/entry_constants.dart';

class EntryScreen extends StatefulWidget {
  EntryScreen({Key key, this.selectedDate}) : super(key: key);
  final DateTime selectedDate;

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  TextEditingController answerController;
  TextEditingController noteController;
  int mood;
  int hoursSlept;
  int water;
  int activity;
  int questionNumber;

  double holdHoursSlept;
  double holdWater;

  EntryConstants entryConstants = new EntryConstants();

  @override
  void initState() {
    answerController = new TextEditingController();
    noteController = new TextEditingController();
    questionNumber = Random().nextInt(15);
    hoursSlept = 2;
    water = 2;
    holdHoursSlept = 2.0;
    holdWater = 2.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 375.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        'How did you feel today?',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                            startAngle: 270,
                            angleRange: 360,
                            customColors: CustomSliderColors(
                              gradientStartAngle: 270,
                              gradientEndAngle: 630,
                              progressBarColors: [
                                Colors.blue,
                                Colors.lightBlue,
                              ],
                            ),
                            size: 250,
                          ),
                          initialValue: 0,
                          min: 0,
                          max: 12,
                          onChange: (value) {
                            print(value);
                            mood = value.floor();
                          },
                          innerWidget: (value) {
                            String moodString = '';
                            if (value < 4) {
                              moodString = 'bad';
                            } else if (value < 8) {
                              moodString = 'medium';
                            } else {
                              moodString = 'good';
                            }
                            return Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,children: [
                                Text(moodString),
                                Text(
                                  (value / 12 * 101).floor().toString() +
                                      '/100%',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ]),
                            );
                          }),
                    ],
                  ),
                ),
              ),
              /*
              SingleCircularSlider(
                  divisions,
                  position
              ),*/
              SizedBox(
                height: 30.0,
              ),

              Container(
                height: 250.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('How much water did you drink today?'),
                          Text(water.toString() + ' cups'),
                          Slider(
                            min: 0.0,
                            max: 12.0,
                            value: holdWater,
                            onChanged: (value) {
                              setState(() {
                                holdWater = value;
                                water = value.floor();
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('How much did you sleep last night?'),
                          Text(hoursSlept.toString() + ' hours'),
                          Slider(
                            min: 0.0,
                            max: 12.0,
                            value: holdHoursSlept,
                            onChanged: (value) {
                              setState(() {
                                holdHoursSlept = value;
                                hoursSlept = value.floor();
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
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
                height: 30,
              ),
              Container(
                height: 460.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'What did you do today?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width / 8),
                          child: GridView.count(
                            primary: false,
                            shrinkWrap: false,
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[0]),
                                    color: activity == 0 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 0;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[1]),
                                    color: activity == 1 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 1;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[2]),
                                    color: activity == 2 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 2;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[3]),
                                    color: activity == 3 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 3;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[4]),
                                    color: activity == 4 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 4;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[5]),
                                    color: activity == 5 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 5;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[6]),
                                    color: activity == 6 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 6;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[7]),
                                    color: activity == 7 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 7;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.9),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FlatButton(
                                    shape: CircleBorder(
                                        //side: BorderSide(color: Colors.black12),
                                        side: BorderSide.none),
                                    child:
                                        Icon(entryConstants.activityIcons[8]),
                                    color: activity == 8 ? Colors.grey : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        activity = 8;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),

              Container(
                height: 125.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(entryConstants.questions[questionNumber]),
                        TextField(
                          controller: answerController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.0),
              Container(
                height: 200.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: noteController,
                        decoration: InputDecoration(
                          hintText: 'Write a note!',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*
              RaisedButton(
                child: Text('Submit'),
                onPressed: () async {
                  FirebaseUser userData = await FirebaseAuth.instance.currentUser();
                  String userUID = userData.uid;
                  Entry addEntry = new Entry(
                      mood: mood,
                      hoursSlept: hoursSlept,
                      water: water,
                      activity: activity,
                      questionNumber: questionNumber,
                      note: noteController.text,
                      questionAnswer: answerController.text,
                      date: Timestamp.fromDate(widget.selectedDate));
                  Firestore.instance
                      .collection('users')
                      .document(userUID)
                      .collection('entries')
                      .add(addEntry.toJson());
                  Navigator.pop(context);
                },
              ),*/

              SizedBox(
                height: 15.0,
              ),

              ClipOval(
                child: Material(
                  color: Colors.blue, // button color
                  child: InkWell(
                    splashColor: Colors.red, // inkwell color
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        )),
                    onTap: () async {
                      FirebaseUser userData =
                          await FirebaseAuth.instance.currentUser();
                      String userUID = userData.uid;
                      Entry addEntry = new Entry(
                          mood: mood,
                          hoursSlept: hoursSlept,
                          water: water,
                          activity: activity,
                          questionNumber: questionNumber,
                          note: noteController.text,
                          questionAnswer: answerController.text,
                          date: Timestamp.fromDate(widget.selectedDate));
                      Firestore.instance
                          .collection('users')
                          .document(userUID)
                          .collection('entries')
                          .add(addEntry.toJson());
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
