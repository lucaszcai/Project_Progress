import 'package:flutter/material.dart';

class EntryConstants {
  static List<String> questions = [
    "How did you feel today?",
    "How many hours of sleep did you get?",
    "How much water did you drink today?",
    "Question of the Day:",
    "What did you do today?",

    "Any Notes for Today?",
    "Submit?"
  ];

  static List<String> moods = [
    "Bad",
    "Meh",
    "Good",
  ];

  static List<String> questionsOfTheDay = [
    "One thing you are grateful for?",
    "Something that made you smile today: ",
    "One thing that made you laugh: ",
    "One person you are thankful for:  ",
    "Five things you would like to do more:  ",
    "Share a childhood memory.",
    "Name three things you do well. ",
    "Write about someone you admire.",
    "What is your favorite hobby?",
    "What is a fact about you that you don’t often share?",
    "What is one thing you dream of doing?",
    "If you could go anywhere in the world, where would it be? ",
    "Favorite moment this week?  ",
    "What is your favorite song right now?",
    "Name a quote to live by. ",
    "How do you relax?  ",
    "What do you feel most strongly about?",
    "Who is a special person in your life right now?  ",
    "What is something you are proud of?  ",
    "What do you love about yourself?  ",
    "What are three of your absolute favorite activities?"
  ];

  static List<String> questionOptions = [
    "Work",
    "Education",
    "Relaxation",
    "Family",
    "Food",
    "Friends",
    "Extra-Curricular",
    "Other"
  ];

  static final questionText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
    fontSize: 20,
  );


  static final moodText = TextStyle(fontSize: 24.0, color: Colors.white);

  static List<String> colorList = [
    "#D267B2",
    "#D168B0",
    "#D06AAF",
    "#CF6CAD",
    "#CE6DAC",
    "#CD6FAA",
    "#CC71A9",
    "#CB72A7",
    "#CA74A6",
    "#C976A4",
    "#C977A3",
    "#C879A2",
    "#C77BA0",
    "#C67C9F",
    "#C57E9D",
    "#C4809C",
    "#C3819A",
    "#C28399",
    "#C18597",
    "#C18696",
    "#C08894",
    "#BF8A93",
    "#BE8B92",
    "#BD8D90",
    "#BC8F8F",
    "#BB908D",
    "#BA928C",
    "#B9948A",
    "#B99589",
    "#B89787",
    "#B79986",
    "#B69A84",
    "#B59C83",
    "#B49E82",
    "#B39F80",
    "#B2A17F",
    "#B1A37D",
    "#B1A47C",
    "#B0A67A",
    "#AFA879",
    "#AEA977",
    "#ADAB76",
    "#ACAD74",
    "#ABAE73",
    "#AAB072",
    "#A9B270",
    "#A9B36F",
    "#A8B56D",
    "#A7B76C",
    "#A6B86A",
    "#A5BA69",
    "#A4BC67",
    "#A3BD66",
    "#A2BF64",
    "#A1C163",
    "#A1C262",
    "#A0C460",
    "#9FC65F",
    "#9EC75D",
    "#9DC95C",
    "#9CCB5A",
    "#9BCC59",
    "#9ACE57",
    "#99D056",
    "#99D255",
    "#99D255",
    "#97D155",
    "#96D155",
    "#95D156",
    "#94D156",
    "#93D157",
    "#92D157",
    "#91D158",
    "#90D158",
    "#8FD159",
    "#8ED159",
    "#8DD05A",
    "#8CD05A",
    "#8BD05B",
    "#8AD05B",
    "#89D05C",
    "#88D05C",
    "#86D05C",
    "#85D05D",
    "#84D05D",
    "#83D05E",
    "#82D05E",
    "#81CF5F",
    "#80CF5F",
    "#7FCF60",
    "#7ECF60",
    "#7DCF61",
    "#7CCF61",
    "#7BCF62",
    "#7ACF62",
    "#79CF63",
    "#78CF63",
    "#77CF64",
    "#75CE64",
    "#74CE64",
    "#73CE65",
    "#72CE65",
    "#71CE66",
    "#70CE66",
    "#6FCE67",
    "#6ECE67",
    "#6DCE68",
    "#6CCE68",
    "#6BCD69",
    "#6ACD69",
    "#69CD6A",
    "#68CD6A",
    "#67CD6B",
    "#66CD6B",
    "#64CD6B",
    "#63CD6C",
    "#62CD6C",
    "#61CD6D",
    "#60CD6D",
    "#5FCC6E",
    "#5ECC6E",
    "#5DCC6F",
    "#5CCC6F",
    "#5BCC70",
    "#5ACC70",
    "#59CC71",
    "#58CC71",
    "#57CC72",
    "#56CC72",];
}

/*
D267B2
D168B0
D06AAF
CF6CAD
CE6DAC
CD6FAA
CC71A9
CB72A7
CA74A6
C976A4
C977A3
C879A2
C77BA0
C67C9F
C57E9D
C4809C
C3819A
C28399
C18597
C18696
C08894
BF8A93
BE8B92
BD8D90
BC8F8F
BB908D
BA928C
B9948A
B99589
B89787
B79986
B69A84
B59C83
B49E82
B39F80
B2A17F
B1A37D
B1A47C
B0A67A
AFA879
AEA977
ADAB76
ACAD74
ABAE73
AAB072
A9B270
A9B36F
A8B56D
A7B76C
A6B86A
A5BA69
A4BC67
A3BD66
A2BF64
A1C163
A1C262
A0C460
9FC65F
9EC75D
9DC95C
9CCB5A
9BCC59
9ACE57
99D056
99D255
99D255
97D155
96D155
95D156
94D156
93D157
92D157
91D158
90D158
8FD159
8ED159
8DD05A
8CD05A
8BD05B
8AD05B
89D05C
88D05C
86D05C
85D05D
84D05D
83D05E
82D05E
81CF5F
80CF5F
7FCF60
7ECF60
7DCF61
7CCF61
7BCF62
7ACF62
79CF63
78CF63
77CF64
75CE64
74CE64
73CE65
72CE65
71CE66
70CE66
6FCE67
6ECE67
6DCE68
6CCE68
6BCD69
6ACD69
69CD6A
68CD6A
67CD6B
66CD6B
64CD6B
63CD6C
62CD6C
61CD6D
60CD6D
5FCC6E
5ECC6E
5DCC6F
5CCC6F
5BCC70
5ACC70
59CC71
58CC71
57CC72
56CC72
55CC73	*/

