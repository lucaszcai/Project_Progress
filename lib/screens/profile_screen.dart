import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_progress/models/Entry.dart';
import 'package:project_progress/models/user_model.dart';
import 'package:project_progress/screens/help_resources_screen.dart';
import 'package:project_progress/screens/see_all_entries_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  List<Entry> allEntries;
  User currentUser;
  bool loaded;

  @override
  void initState() {
    allEntries = new List<Entry>();
    loaded = false;
    setUpData();
    super.initState();
  }

  setUpData() async {
    await getUser();
    await getEntries();

    setState(() {
      loaded = true;
    });
  }

  getUser() async {
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot userData = await Firestore.instance
        .collection('users')
        .document(getUser.uid)
        .get();
    currentUser = User.fromSnapshot(userData);
  }

  getEntries() async {
    QuerySnapshot getEntries =
        await currentUser.reference.collection('entries').getDocuments();
    List<DocumentSnapshot> entryDocuments = getEntries.documents;
    for (int i = 0; i < entryDocuments.length; i++) {
      allEntries.add(Entry.fromSnapshot(entryDocuments[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Mental Health Professional',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
            width: 200,
            child: Divider(color: Colors.blueAccent),
          ),
          loaded
              ? Container(
                  //color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.add_a_photo,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      'Entries Made: ' + allEntries.length.toString(),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.blueAccent,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeAllEntriesScreen(
                                  allEntries: allEntries,
                                )),
                      );
                    },
                  ),
                )
              : CircularProgressIndicator(),
          Container(
            //color: Colors.white,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.add_location,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Followers',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            //color: Colors.white,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Member since: 2/27/2020',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print('tapped');
              _launchUrl('https://www.nami.org/Home');
            },
            child: Container(
              //color: Colors.white,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.description,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Resources',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpResourcesScreen()),
              );
            },
            child: Container(
              //color: Colors.white,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'I need help!',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  _launchUrl(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      print('can\'t launch url');
    }
  }
}
