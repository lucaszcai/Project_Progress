import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_progress/screens/chat_screen.dart';
import 'package:uuid/uuid.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final Firestore _firestore = Firestore.instance;

  String user;
  bool doneLoading;

  @override
  void initState() {
    doneLoading = false;
    setUp();
    super.initState();
  }

  setUp() async {
    await getUser();
    setState(() {
      doneLoading = true;
    });
  }

  getUser() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = currentUser.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!doneLoading) {
      return Scaffold(
        body: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(
                  'School Chat',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                              user: user,
                              chatId: 'global',
                            )),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.chat_bubble),
                title: Text('Talk to a Counselor'),
                onTap: () {
                  addChat(context);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder<QuerySnapshot>(
                future: Firestore.instance.collection('chats').getDocuments(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return CircularProgressIndicator();
                  } else {
                    List<DocumentSnapshot> allChats = snapshot.data.documents;
                    return Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: allChats.length,
                          itemBuilder: (BuildContext context, int i) {
                            String name = '';
                            if (allChats[i].data['user1'] == user) {
                              name = allChats[i].data['user2'];
                            } else {
                              name = allChats[i].data['user1'];
                            }
                            return ListTile(
                              title: Text(name),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                            user: user,
                                            chatId: allChats[i].data['chatid'],
                                          )),
                                );
                              },
                              trailing: Icon(Icons.chevron_right),
                            );
                          }),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    }
  }

  Future addChat(BuildContext context) async {
    String email = await _asyncInputDialog(context);
    Uuid uid = new Uuid();
    String s = uid.v1();
    if (email.length > 0)
      await _firestore.collection('chats').add(
          {'user1': user, 'user2': email, 'chatid': s, 'calendarshare': 0});
    setState(() {});
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
    super.dispose();
  }
}
