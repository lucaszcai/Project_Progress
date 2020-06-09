//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:project_progress/models/message_model.dart';
//import 'package:project_progress/screens/community_screen.dart';
//
//
//class FriendsList extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Expanded(
//      child: Container(
//        decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(30.0),
//              topRight: Radius.circular(30.0),
//            )
//        ),
//        child: ClipRRect(
//          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(30.0),
//            topRight: Radius.circular(30.0),
//          ),
//          child: Column(
//            children: <Widget>[
//              Expanded(
//                child: ListView.builder(
//                  itemCount: chats.length,
//                  itemBuilder: (BuildContext context, int index){
//                    final chat = chats[index];
//                    return GestureDetector(
//                      //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(
//                      //user: chat.sender,
//                      //))),
//
//                      child: Container(
//                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20),
//                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.only(
//                            topRight: Radius.circular(20.0),
//                            bottomLeft: Radius.circular(20.0),
//                          ),
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Row(
//                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
//                              children: <Widget>[
//                                Row(
//                                  children: <Widget>[
//                                    CircleAvatar(
//                                      radius: 35.0,
//                                      backgroundImage: AssetImage(chat.sender.imageUrl
//                                      ),
//                                    ),
//                                    SizedBox(width: 10.0,),
//                                    Column(
//                                      crossAxisAlignment: CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        Text(
//                                          chat.sender.name,
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                            fontSize: 20.0,
//                                            fontWeight: FontWeight.bold,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//
//                              ],
//                            ),
//
//                            Align(
//                              alignment: Alignment.centerRight,
//                              child: Row(
//                                children: <Widget>[
//                                  IconButton(icon: Icon(Icons.chat,)),
//                                  IconButton(icon: Icon(Icons.calendar_today,)),
//
//                                ],
//                              ),
//                            ),
//
//
//                          ],
//                        ),
//                      ),
//                    );
//                  },
//                ),
//              ),
//            ],
//          ),
//        ),
//
//      ),
//    );
//  }
//}