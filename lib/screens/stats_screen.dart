import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Stats extends StatefulWidget{
  @override
  _Stats createState() => _Stats();
}

class _Stats extends State<Stats>{

  List<int> sleep = new List<int>(),
      mood = new List<int>(),
      water = new List<int>(),
      questionId = new List<int>(),
      activity = new List<int>();
  List<int> date = new List<int>();
  List<String> answer = new List<String>(), note = new List<String>();

  List<int> testMoodList = new List<int>();

  Material sleepItem(String title, String subtitle){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle + " hrs",style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material waterItem(String title, String subtitle){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle + " glasses",style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material piechartItem(String title){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),


                  //genPieGraph(testMoodList),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material moodchartItem(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),



                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material activitescharItem(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:StaggeredGridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
            child: moodchartItem("Mood vs Sleep"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
            child: piechartItem("Mood"),
        ),
        Padding(
          padding: const EdgeInsets.only(right:8.0),
            child: sleepItem("Average Sleep","8"),
        ),
        Padding(
          padding: const EdgeInsets.only(right:8.0),
            child: waterItem("Average Water","5"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
            child: activitescharItem("Activities"),
        ),
    ],

    staggeredTiles: [
      StaggeredTile.extent(4, 250.0),
      StaggeredTile.extent(2, 250.0),
      StaggeredTile.extent(2, 120.0),
      StaggeredTile.extent(2, 120.0),
      StaggeredTile.extent(4, 250.0),
    ],
    ),
    );

  }
}