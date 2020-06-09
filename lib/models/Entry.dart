import 'package:cloud_firestore/cloud_firestore.dart';

class Entry {

  int mood;
  int water;
  String note;
  Timestamp date;

  DocumentReference reference;

  Entry({this.mood, this.water, this.note, this.date, this.reference});

  factory Entry.fromSnapshot(DocumentSnapshot snapshot) {
    Entry newEntry = Entry.fromJson(snapshot.data);
    newEntry.reference = snapshot.reference;
    return newEntry;
  }

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      mood: json['mood'] as int,
      water: json['water'] as int,
      note: json['note'] as String,
      date: json['date'] as Timestamp
    );
  }

  Map<String, dynamic> toJson() => _EntryToJson(this);

  Map<String, dynamic> _EntryToJson(Entry instance) {
    return <String, dynamic> {
      'mood': instance.mood,
      'water': instance.water,
      'note': instance.note,
      'date': instance.date,
    };
  }
}