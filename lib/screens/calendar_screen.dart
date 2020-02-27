import 'package:flutter/material.dart';
import 'package:project_progress/widgets/calendar_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget{
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar>{

  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
          //CalendarWidget(calendarController: _calendarController),

          TableCalendar(
            calendarController: _calendarController,
          ),
        ],
      )
    );
  }
}