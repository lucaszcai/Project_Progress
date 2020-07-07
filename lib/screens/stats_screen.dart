import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_progress/helpers/stats_helper.dart';

import 'package:project_progress/models/Entry.dart';
import 'package:project_progress/models/user_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_progress/utils/entry_constants.dart';

class Stats extends StatefulWidget {
  @override
  _Stats createState() => _Stats();
}

class _Stats extends State<Stats> {
  User currentUser;
  StatsHelper statsHelper;

  @override
  initState() {
    statsHelper = new StatsHelper();
    super.initState();
  }

  Future<List<Entry>> setUpData() async {
    List<Entry> allEntries = new List();

    FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
    DocumentSnapshot userData = await Firestore.instance
        .collection('users')
        .document(getUser.uid)
        .get();
    currentUser = User.fromSnapshot(userData);
    
    QuerySnapshot goodMood = await userData.reference.collection('entries').where('mood', isGreaterThan: 4).where('questionNumber',isEqualTo: 10).getDocuments();
    for (int i = 0; i < goodMood.documents.length; i++) {
      print(goodMood.documents[i].data['date'].toString() + ' ' + goodMood.documents[i].data['mood'].toString() + ' ' + goodMood.documents[i].data['questionNumber'].toString());
    }

    QuerySnapshot entriesData =
        await userData.reference.collection('entries').getDocuments();
    for (int i = 0; i < entriesData.documents.length; i++) {
      allEntries.add(new Entry.fromSnapshot(entriesData.documents[i]));
    }

    return allEntries;
  }

  //Get list of points for mood
  List<FlSpot> getMoodLineChartData(List<Entry> allEntries) {
    List<FlSpot> points = new List<FlSpot>();
    for (int i = 0; i < allEntries.length; i++) {
      points.add(new FlSpot(
          statsHelper.dateToInt(allEntries[i].date.toDate()).toDouble(),
          allEntries[i].mood + 0.0));
    }
    return points;
  }

  //Get list of points for sleep
  List<FlSpot> getSleepLineChartData(List<Entry> allEntries) {
    List<FlSpot> points = new List<FlSpot>();
    for (int i = 0; i < allEntries.length; i++) {
      points.add(new FlSpot(
          statsHelper.dateToInt(allEntries[i].date.toDate()).toDouble(),
          allEntries[i].hoursSlept + 0.0));
    }
    return points;
  }

  List<PieChartSectionData> getMoodPieChartData(List<Entry> allEntries) {
    List<PieChartSectionData> sections = new List<PieChartSectionData>();
    int goodMood = 0;
    int mediumMood = 0;
    int badMood = 0;
    for (int i = 0; i < allEntries.length; i++) {
      if (allEntries[i].mood < 4) {
        badMood++;
      } else if (allEntries[i].mood < 8) {
        mediumMood++;
      } else {
        goodMood++;
      }
    }
    sections.add(new PieChartSectionData(
      value: goodMood + 0.0,
      color: Colors.blue,
      radius: 25,
      title: goodMood.toString(),
    ));
    sections.add(new PieChartSectionData(
      value: mediumMood + 0.0,
      color: Colors.orange,
      radius: 25,
      title: mediumMood.toString(),
    ));
    sections.add(new PieChartSectionData(
      value: badMood + 0.0,
      color: Colors.red,
      radius: 25,
      title: badMood.toString(),
    ));
    return sections;
  }

  double getAvgSleep(List<Entry> allEntries) {
    double avgSleep = 0;
    for (int i = 0; i < allEntries.length; i++) {
      avgSleep += allEntries[i].hoursSlept;
    }
    avgSleep /= allEntries.length;
    return avgSleep;
  }

  double getAvgWater(List<Entry> allEntries) {
    double avgWater = 0;
    for (int i = 0; i < allEntries.length; i++) {
      avgWater += allEntries[i].water;
    }
    avgWater /= allEntries.length;
    return avgWater;
  }

  List<BarChartGroupData> getActivitiesBarChartData(List<Entry> allEntries) {
    List<BarChartGroupData> groups = new List<BarChartGroupData>();
    List<int> activityCount = new List<int>(9);
    activityCount.fillRange(0, 9, 0);
    for (int i = 0; i < allEntries.length; i++) {
      int activity = allEntries[i].activity;
      activityCount[activity]++;
    }
    for (int i = 0; i < 9; i++) {
      groups.add(new BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            y: activityCount[i].toDouble(),
            width: 14.0,
          ),
        ],
      ));
    }
    return groups;
  }

  Material moodVsSleepChartItem(
      String title, List<FlSpot> moodData, List<FlSpot> sleepData) {
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
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 175,
                      //width: 350,
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: moodData,
                              isCurved: true,
                              colors: [Colors.blue],
                            ),
                            LineChartBarData(
                              spots: sleepData,
                              isCurved: true,
                              colors: [Colors.green],
                            ),
                          ],
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                                showTitles: true,
                                interval: 5,
                                getTitles: (double date) {
                                  return statsHelper
                                      .intToDateString(date.round());
                                }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material moodPieChart(String title, List<PieChartSectionData> graphData) {
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
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      height: 125,
                      width: 125,
                      child: PieChart(
                        PieChartData(
                          sections: graphData,
                          borderData: FlBorderData(
                            show: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      SizedBox(width: 12.0,),
                      Text('Good'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(color: Colors.orange),
                      ),
                      SizedBox(width: 12.0,),
                      Text('Meh'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      SizedBox(width: 12.0,),
                      Text('Bad'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material sleepItem(String title, String subtitle) {
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
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle + " hrs",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material waterItem(String title, String subtitle) {
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
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle + " glasses",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material activitiesBarChart(
      String title, List<BarChartGroupData> activityData) {
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
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 50,
                      child: BarChart(
                        BarChartData(
                          barGroups: activityData,
                          borderData: FlBorderData(
                            show: true,
                            border: Border(
                              bottom: BorderSide(width: 1.0),
                              left: BorderSide(width: 1.0),
                            ),
                          ),
                          barTouchData: BarTouchData(
                            touchTooltipData: BarTouchTooltipData(
                                getTooltipItem: (BarChartGroupData groupData,
                                    int groupInd,
                                    BarChartRodData rodData,
                                    int rodInd) {
                              return BarTooltipItem(
                                EntryConstants().activityNames[groupInd] +
                                    ': ' +
                                    rodData.y.toString(),
                                TextStyle(color: Colors.lightBlue),
                              );
                            }),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTitles: (double index) {
                                return EntryConstants()
                                    .activityNames[index.round()];
                              },
                              textStyle: TextStyle(
                                  fontSize: 10.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
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
    return FutureBuilder<List<Entry>>(
        future: setUpData(), // async work
        builder: (BuildContext context, AsyncSnapshot<List<Entry>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            List<Entry> allEntries = snapshot.data;
            allEntries.sort((Entry entryA, Entry entryB) {
              return entryA.date.millisecondsSinceEpoch -
                  entryB.date.millisecondsSinceEpoch;
            });

            List<FlSpot> moodLineChartData = getMoodLineChartData(allEntries);
            List<FlSpot> sleepLineChartData = getSleepLineChartData(allEntries);
            List<PieChartSectionData> moodPieChartData =
                getMoodPieChartData(allEntries);
            List<BarChartGroupData> activitiesChartData =
                getActivitiesBarChartData(allEntries);

            double avgSleep = getAvgSleep(allEntries);
            double avgWater = getAvgWater(allEntries);

            return Container(
              child: StaggeredGridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: moodVsSleepChartItem(
                        "Mood vs Sleep", moodLineChartData, sleepLineChartData),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: moodPieChart("Mood", moodPieChartData),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child:
                        sleepItem("Average Sleep", avgSleep.toStringAsFixed(1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child:
                        waterItem("Average Water", avgWater.toStringAsFixed(1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        activitiesBarChart("Activities", activitiesChartData),
                  ),
                ],
                staggeredTiles: [
                  StaggeredTile.extent(4, 250.0),
                  StaggeredTile.extent(2, 300.0),
                  StaggeredTile.extent(2, 140.0),
                  StaggeredTile.extent(2, 140.0),
                  StaggeredTile.extent(4, 250.0),
                ],
              ),
            );
          }
        });
  }
}
