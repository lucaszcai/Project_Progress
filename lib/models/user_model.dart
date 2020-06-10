import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String email;

  DocumentReference reference;

  User({this.uid, this.email, this.reference});

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    User newUser = User.fromJson(snapshot.data);
    newUser.reference = snapshot.reference;
    return newUser;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() => _UserToJson(this);

  Map<String, dynamic> _UserToJson(User instance) {
    return <String, dynamic> {
      'uid': instance.uid,
      'email': instance.email,
    };
  }
}