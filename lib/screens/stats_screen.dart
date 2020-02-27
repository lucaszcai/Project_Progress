import 'package:flutter/material.dart';

class Stats extends StatefulWidget{
  @override
  _Stats createState() => _Stats();
}

class _Stats extends State<Stats>{

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Colors.blueAccent),
      child: Center(child: Text('Stats')),
    );
  }
}