import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project_progress/helpers/stats_helper.dart';
import 'package:project_progress/models/Entry.dart';

class SeeAllEntriesScreen extends StatelessWidget {
  SeeAllEntriesScreen({Key key, this.allEntries}) : super(key: key);

  final List<Entry> allEntries;
  final StatsHelper _statsHelper = new StatsHelper();

  @override
  Widget build(BuildContext context) {
    allEntries.sort((Entry entryA, Entry entryB) {
      return entryA.date.millisecondsSinceEpoch -
          entryB.date.millisecondsSinceEpoch;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('All Entries'),
      ),
      body: ListView.builder(
          itemCount: allEntries.length,
          itemBuilder: (BuildContext context, int i) {
            String title =
                _statsHelper.dateTimeToDateString(allEntries[i].date.toDate());
            return ExpansionTile(
              title: Text(title),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mood:'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: allEntries[i].mood / 12,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                ),
                //Text('Water: ' + allEntries[i].water.toString()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Water:'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: allEntries[i].water / 12,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                ),
                //Text('Hours Slept: ' + allEntries[i].hoursSlept.toString()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hours Slept:'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: allEntries[i].hoursSlept / 12,
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
