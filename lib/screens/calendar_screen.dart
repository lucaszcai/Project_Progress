import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_progress/models/Entry.dart';
import 'package:project_progress/models/user_model.dart';
import 'package:project_progress/screens/entry_screen.dart';
import 'package:project_progress/screens/home_screen.dart';
import 'package:project_progress/screens/onboarding_screen.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:intl/intl.dart';


class Calendar extends StatefulWidget{
  Calendar({Key key}) : super(key: key);

  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar>{

  CalendarController _calendarController;

  double _pinPillPosition = -500;

  bool _pinPillup = false;

  DateTime selectedDate;
  User currentUser;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    getCurrentUser();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  getCurrentUser() async {
    FirebaseUser holdUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot userData = await Firestore.instance.collection('users').document(holdUser.uid).get();
    setState(() {
      currentUser = User.fromSnapshot(userData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          print(currentUser.uid);
          Entry entry = Entry(mood: 5, water: 10, note: 'test', date: Timestamp.fromDate(DateTime.now()));
          await currentUser.reference.collection('entries').add(entry.toJson());
          DocumentSnapshot userData = await Firestore.instance.collection('users').document(currentUser.uid).get();
          print(userData.data);
          User userSnapshot = User.fromSnapshot(userData);
          print('UID: ' + userSnapshot.uid + ' Email: ' + userSnapshot.email);
          QuerySnapshot userEntries = await userSnapshot.reference.collection('entries').getDocuments();
          print('entries: ' + userEntries.documents.toString());
          setState(() {
            //_pinPillPosition = 0;
            //_pinPillup = !_pinPillup;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EntryScreen()),
            );
          });
        },
        backgroundColor: Color(0xFF30A9B2),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children:<Widget>[
            Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                  _buildCalendar()
                ]),
            AnimatedPositioned(
              bottom: _pinPillup ? _pinPillPosition = 0 : _pinPillPosition = -500,
              right: 0,
              left: 0,
              duration: Duration(milliseconds: 200),
              child: Align(
              alignment: Alignment.bottomCenter,
                child: Container(
                margin: EdgeInsets.all(20),
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: <BoxShadow>[
                BoxShadow(
                blurRadius: 20,
                offset: Offset.zero,
                color: Colors.grey.withOpacity(1),
                  ),
                  ]
                ),
                  child: _buildDayOverview(),
              ),
            ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

          ],

        ),
      ),
        );
  }

  Widget _buildDayOverview(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
                'Saturday, March 3rd',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),

            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Mood', style: TextStyle(
                    fontSize: 15,
                  ),),
                  LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 14.0,
                    percent: 0.5,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Sleep', style: TextStyle(
                    fontSize: 15,
                  ),),
                  LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 14.0,
                    percent: 0.5,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Glasses of water', style: TextStyle(
                    fontSize: 15,
                  ),),
                  LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 14.0,
                    percent: 0.5,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Activity of the Day', style: TextStyle(
                    fontSize: 15,
                  ),),
                  Icon(
                    Icons.directions_bike,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Notes:', style: TextStyle(
                    fontSize: 15,
                  ),),
                  Text(
                    'Have a great day!',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );

  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      selectedDate = day;
      _pinPillup = true;
    });
  }

  Widget _buildCalendar(){
    return Container(
      //color: Color(0xff465466),
      //color: Colors.white,
      child: TableCalendar(
        onDaySelected:_onDaySelected,
        locale: 'en_US',
        //events: _selectedDay,
        calendarController: _calendarController,
        //initialCalendarFormat: CalendarFormat.month,
        formatAnimation: FormatAnimation.slide,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        availableGestures: AvailableGestures.horizontalSwipe,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        calendarStyle: CalendarStyle(
          weekdayStyle: TextStyle(color: Colors.black),
          weekendStyle: TextStyle(color: Colors.red),
          outsideStyle: TextStyle(color: Colors.grey),
          unavailableStyle: TextStyle(color: Colors.grey),
          outsideWeekendStyle: TextStyle(color: Colors.grey),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextBuilder: (date, locale) {
            return DateFormat.E(locale)
                .format(date)
                .substring(0, 3)
                .toUpperCase();
          },
          weekdayStyle: TextStyle(color: Colors.grey),
          weekendStyle: TextStyle(color: Colors.grey),
        ),
        headerVisible: true,
        headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0)
        ),
        builders: CalendarBuilders(
          markersBuilder: (context, date, events, holidays) {
            return [
              Container(
                decoration: new BoxDecoration(
                  color: Color(0xFF30A9B2),
                  //color: Color(C),
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.all(4.0),
                width: 4,
                height: 4,
              )
            ];
          },
          selectedDayBuilder: (context, date, _) {
            return Container(
              decoration: new BoxDecoration(
                color: Color(0xFF30A9B2),
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(4.0),
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}