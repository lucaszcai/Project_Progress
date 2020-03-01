import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:project_progress/utils/style_constants.dart';
import 'package:project_progress/utils/entry_constants.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPage createState() => _EntryPage();
  //final int time;

  //EntryPage({Key key, @required this.time}) : super(key: key);
}

class _EntryPage extends State<EntryPage> {
  final baseColor = Color.fromRGBO(255, 255, 255, 0.3);


  final QDController = TextEditingController();
  final noteController = TextEditingController();

  int initTime;
  int inBedTime;
  int days = 0;
  int level = 255;
  int currentQuestion = 0;
  int qODID = 0;
  int selectedOpt = 1;

  List<int> ends = [20, 20, 20, 254, 254, 254, 254, 254, 254, 254];
  List<int> levels = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<bool> above = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  double moodEnd = 20.0;


  @override
  void initState() {
    super.initState();
    Random r = new Random();
  }

  void _updateLabels(int init, int end, int laps) {
    setState(() {
      inBedTime = init;
      ends[currentQuestion] = end;
      days = laps;
      levels[currentQuestion] = laps;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestion != 6) {
        currentQuestion++;
      } else {
        submit();
      }
    });
  }

  void selected(int a) {
    setState(() {
      selectedOpt = a;
      print(selectedOpt);
      currentQuestion++;
    });
  }

  void prevQuestion() {
    setState(() {
      if (currentQuestion != 0) {
        currentQuestion--;
      } else {
        Navigator.pop(context);
      }
    });
  }

  LinearGradient getGradient(int a) {
    return new LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          //Color.fromRGBO(50, 0, 255 - ends[currentQuestion], 1.0),
          //Color.fromRGBO(0, ends[currentQuestion], 50, 1.0)
        ]);
  }

  void submit() async {

  }

  List<Widget> getOptions() {
    List<Widget> widgets = new List<Widget>();
    int i = 0;
    for (String s in EntryConstants.questionOptions) {
      widgets.add(new FlatButton(
        child: Text('$s'),
        color: baseColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        onPressed: () => {selected(EntryConstants.questionOptions.indexOf(s))},
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    String textt = (currentQuestion == 6) ? "SUBMIT" : "NEXT";

    List<Widget> questionWidgets = [
      new SingleCircularSlider(
        255,
        ends[currentQuestion],
        height: 380.0,
        width: 380.0,
        primarySectors: 0,
        secondarySectors: 0,
        baseColor: Color.fromRGBO(255, 255, 255, 0.1),
        selectionColor: Color.fromRGBO(255, 255, 255, 0.3),
        handlerColor: Colors.white,
        sliderStrokeWidth: 50,
        handlerOutterRadius: 12.0,
        onSelectionChange: _updateLabels,
        showRoundedCapInSelection: false,
        showHandlerOutter: true,
        child: Padding(
            padding: const EdgeInsets.all(42.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  '${EntryConstants.moods[((ends[currentQuestion] * 2.99) / 255).floor()]}',
                  style: EntryConstants.moodText,)
              ],
            )),
        shouldCountLaps: false,
      ),
      new Column(
        children: <Widget>[
          Text(
              '${((ends[currentQuestion] * 12) / 255).round()} hours',
              style: StyleConstants.onboardingText),
          FlutterSlider(
            values: [ends[currentQuestion] + 0.0],
            max: 255,
            min: 0,
            handlerAnimation: FlutterSliderHandlerAnimation(
                curve: Curves.elasticOut,
                reverseCurve: Curves.bounceIn,
                duration: Duration(milliseconds: 500),
                scale: 1.5),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              ends[currentQuestion] = lowerValue.floor();
              setState(() {});
            },
            tooltip: FlutterSliderTooltip(disabled: true),
          )
        ],
      ),

      new SingleCircularSlider(
        255,
        ends[currentQuestion],
        height: 380.0,
        width: 380.0,
        primarySectors: 0,
        secondarySectors: 0,
        baseColor: Color.fromRGBO(255, 255, 255, 0.1),
        selectionColor: Color.fromRGBO(255, 255, 255, 0.3),
        handlerColor: Colors.white,
        sliderStrokeWidth: 50,
        handlerOutterRadius: 12.0,
        onSelectionChange: _updateLabels,
        showRoundedCapInSelection: false,
        showHandlerOutter: true,
        child: Padding(
            padding: const EdgeInsets.all(42.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    setState(() {
                      above[currentQuestion] = true;
                      ends[currentQuestion] = 255;
                      currentQuestion++;
                    });
                  },
                  child: Text(
                    "12+",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: baseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                    '${((ends[currentQuestion] * 12) / 255).round() + levels[currentQuestion] * 10} Glasses',
                    style: TextStyle(fontSize: 24.0, color: Colors.white)),
              ],
            )),
        shouldCountLaps: false,
      ),
      new SizedBox(
          height: 200,
          width: 380,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("${EntryConstants.questionsOfTheDay[qODID]}", style: StyleConstants.answerText,)),
              ),
              //SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextField(
                  style: StyleConstants.textAnswer,
                  controller: QDController,
                ),
              ),
            ],
          )),
      new SizedBox(
          height: 380,
          width: 380,
          child: ListView(
            children: getOptions(),
          )),
      new SizedBox(
        height: 200,
        width: 380,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TextField(
            controller: noteController,
          ),
        ),
      ),
      new SizedBox(
        height: 200,
        width: 380,
      ),
    ];
    //kms
    return Scaffold(
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(

                    color: ends[currentQuestion]~/2 < 128 //(ends[currentQuestion]~/2) < colorList.length
                        ? hexToColor(EntryConstants.colorList[ends[currentQuestion]~/2])
                        : Color.fromARGB(150, 255, 255, 255)

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${EntryConstants.questions[currentQuestion]}',
                        style: EntryConstants.questionText,
                      ),
                    ),
                    questionWidgets[currentQuestion],
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            child: Text('BACK'),
                            color: baseColor,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            onPressed: prevQuestion,
                          ),
                          FlatButton(
                            child: Text(textt),
                            color: baseColor,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            onPressed: () => {
                              setState(() {
                                if (currentQuestion != 6) {
                                  currentQuestion++;
                                } else {
                                  Text('SUBMIT');
                                  submit();
                                  Navigator.pop(context);
                                }
                              })
                            },
                          ),
                        ]),
                  ],
                ))));
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  void dispose() {
    super.dispose();
  }
}



