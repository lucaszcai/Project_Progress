import 'package:cloud_firestore/cloud_firestore.dart';

class Entry {

  int mood;
  int hoursSlept;
  int water;
  int activity;
  int questionNumber;
  String note;
  String questionAnswer;
  Timestamp date;

  DocumentReference reference;

  Entry({this.mood, this.hoursSlept, this.water, this.activity, this.questionNumber, this.note, this.questionAnswer, this.date, this.reference});

  factory Entry.fromSnapshot(DocumentSnapshot snapshot) {
    Entry newEntry = Entry.fromJson(snapshot.data);
    newEntry.reference = snapshot.reference;
    return newEntry;
  }

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      mood: json['mood'] as int,
      hoursSlept: json['sleep'] as int,
      water: json['water'] as int,
      activity: json['activity'] as int,
      questionNumber: json['questionNumber'] as int,
      note: json['note'] as String,
      questionAnswer: json['questionAnswer'] as String,
      date: json['date'] as Timestamp
    );
  }

  Map<String, dynamic> toJson() => _EntryToJson(this);

  Map<String, dynamic> _EntryToJson(Entry instance) {
    return <String, dynamic> {
      'mood': instance.mood,
      'hoursSlept': instance.hoursSlept,
      'water': instance.water,
      'activity': instance.activity,
      'questionNumber': instance.questionNumber,
      'note': instance.note,
      'questionAnswer': instance.questionAnswer,
      'date': instance.date,
    };
  }
}