import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_progress/models/Entry.dart';
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
              mood = value.round();
            },
          ),
          Text('How much water did you drink today?'),
          Slider(
            min: 0.0,
            max: 12.0,
            value: holdWater,
            onChanged: (value) {
              setState(() {
                holdWater = value;
                water = value.round();
              });
            },
          ),
          Text('How much did you sleep last night?'),
          Slider(
            min: 0.0,
            max: 12.0,
            value: holdHoursSlept,
            onChanged: (value) {
              setState(() {
                holdHoursSlept = value;
                hoursSlept = value.round();
              });
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
                          child: Icon(entryConstants.activityIcons[0]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 0;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[1]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 1;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[2]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 2;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[3]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 3;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[4]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 4;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[5]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 5;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[6]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 6;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[7]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 7;
                          },
                        ),
                        FlatButton(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.black12),
                          ),
                          child: Icon(entryConstants.activityIcons[8]),
                          color: Colors.white,
                          onPressed: () {
                            activity = 8;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(entryConstants.questions[questionNumber]),
              TextField(
                controller: answerController,
              ),
            ],
          ),
          Column(
            children: [
              TextField(
                controller: noteController,
                decoration: InputDecoration(
                  hintText: 'Write a note!',
                ),
              ),
            ],
          ),
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
          )
        ],
      ),
    );
  }
}
