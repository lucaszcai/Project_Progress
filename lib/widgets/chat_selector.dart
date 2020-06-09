//import 'package:flutter/material.dart';
//import 'package:project_progress/models/message_model.dart';
//import 'package:project_progress/screens/chat_screen.dart';
//
//class ChatSelector extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.symmetric(vertical: 10.0),
//      child: Column(
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.symmetric(horizontal: 20.0),
//            child: Row(
//              //mainAxisSize: MainAxisSize.max,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  'Chats',
//                  style: TextStyle(
//                    color: Colors.blueGrey,
//                    fontSize: 18.0,
//                    fontWeight: FontWeight.bold,
//                    letterSpacing: 1.0,
//                  ),
//                ),
//                IconButton(
//                  icon: Icon(
//                    Icons.more_horiz,
//                  ),
//                  iconSize: 30.0,
//                  color: Colors.blueGrey,
//                  onPressed: () {},
//                ),
//              ],
//            ),
//          ),
//
//          Container(
//            //height: 120.0,
//            width: MediaQuery.of(context).size.width,
//            child: Column(
//              children: <Widget>[
//                ListTile(
//                  leading: Icon(Icons.school),
//                  title: Text("School Chat"),
//                  trailing: Icon(Icons.keyboard_arrow_right),
//                ),
//                ListTile(
//                  leading: Icon(Icons.chat_bubble),
//                  title: Text("Talk to Someone"),
//                  trailing: Icon(Icons.keyboard_arrow_right),
//                ),
//              ],
//            )
//
//          )
//        ],
//      ),
//    );
//  }
//}