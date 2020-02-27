import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile>{

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
                'Vincent Do',
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
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.blueAccent
                ),
              ),
              Container(//color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_a_photo,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Entries Made: 23',
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
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
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
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
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
            ],
          )
      ),
    );
  }
}