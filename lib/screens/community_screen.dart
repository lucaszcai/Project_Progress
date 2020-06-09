import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_progress/screens/chat_screen.dart';
import 'package:uuid/uuid.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {



  final Firestore _firestore = Firestore.instance;



  List<Widget> chats = new List<Widget>();
  
  String user;

  ScrollController scrollController = ScrollController();


  @override
  void initState() {
    getChats();
    getCurUser();
    super.initState();
  }

  
  Future getCurUser() async{
    final FirebaseUser us = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = us.email;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(chats[0].toStringShort() != "SizedBox") {
      chats.insert(
          0,
          SizedBox(
            height: 20,
          ));
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(
            children: chats,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future addChat(BuildContext context) async {
    String email = await _asyncInputDialog(context);
    Uuid uid = new Uuid();
    String s = uid.v1();
    if(email.length>0)
      await _firestore.collection('chats').add({
        'user1':user,
        'user2':email,
        'chatid':s,
        'calendarshare':0
      });
    getChats();
  }



  void getChats() {
    chats.clear();
    chats.add(
      Card(
        color: Colors.transparent,
        elevation: 0,
        child: ListTile(
          leading: Icon(Icons.add, color: Colors.black,),
          title: Text("School Chat", style: TextStyle(color: Colors.black),),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen(user:user, chatId: 'global',)),
            );
          },
        ),
      ),
    );
    chats.add(
      Card(
        color: Colors.transparent,
        elevation: 0,
        child: ListTile(
          leading: Icon(Icons.add, color: Colors.black,),
          title: Text("Talk to Someone", style: TextStyle(color: Colors.black),),
          onTap: () {
            addChat(context);
          },
        ),
      ),
    );
    chats.add(
      ListTile(
        //spacer
      ),
    );
    _firestore
        .collection("chats")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      for (DocumentSnapshot d in snapshot.documents) {
        setState(() {
          if (d.data['user1'] == user) {
            String s = d.data['user2'];
            chats.add(
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  title: Text("$s", style: TextStyle(color: Colors.black)),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black,),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen(user:user, chatId: d.data['chatid'],)),
                    );
                  },
                ),
              ),
            );
          } else {
            if (d.data['user2'] == user) {
              String s = d.data['user1'];
              chats.add(
                Card(
                  child: ListTile(
                    title: Text("$s"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen(user:user, chatId: d.data['chatid'],)),
                      );
                    },
                  ),
                ),
              );
            }
          }

        });

      }
    });
  }

  Future<String> _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
      false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter email'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Email', hintText: 'eg. example@gmail.com'),
                    onChanged: (value) {
                      teamName = value;
                    },
                  ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(teamName);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}