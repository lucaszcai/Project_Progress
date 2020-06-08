import 'package:flutter/material.dart';
import 'package:project_progress/widgets/chat_selector.dart';
import 'package:project_progress/widgets/friendslist_widget.dart';

class Community extends StatefulWidget{
  @override
  _Community createState() => _Community();
}

class _Community extends State<Community>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ChatSelector(),
          FriendsList(),
        ],
      ),
    );
  }
}