import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:project_progress/screens/profile_screen.dart';
import 'package:project_progress/screens/stats_screen.dart';

import 'calendar_screen.dart';
import 'community_screen.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  int _selectedTab = 0;
  var _pageOptions = [
    Calendar(),
    Stats(),
    Community(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 0.75)
              )
            ],
            color: Colors.blue,
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.grey[200],
          items: <Widget>[
            Icon(Icons.calendar_today, size: 30),
            Icon(Icons.insert_chart, size: 30),
            Icon(Icons.people, size: 30),
            Icon(Icons.person_pin, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),
      ),
    );
  }
}

