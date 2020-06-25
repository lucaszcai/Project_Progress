import 'package:flutter/material.dart';
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
                Text('Mood: ' + allEntries[i].mood.toString()),
                Text('Water: ' + allEntries[i].water.toString()),
                Text('Hours Slept: ' + allEntries[i].hoursSlept.toString()),
              ],
            );
          }),
    );
  }
}
