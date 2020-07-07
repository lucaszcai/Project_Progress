import 'package:flutter/material.dart';
import 'package:project_progress/screens/login_page.dart';
import 'package:project_progress/screens/root_screen.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Progress',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootScreen(),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}

