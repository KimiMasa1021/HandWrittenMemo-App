import 'package:cloud_firestore/cloud_firestore.dart';

class Picture {
  Picture({this.userId, this.uid, this.title, this.thumbnailUrl});
  final String? userId;
  final String? uid;
  final String? title;
  final String? thumbnailUrl;

  factory Picture.fromSnapshot(DocumentSnapshot doc, String userId) {
    return Picture(
        userId: userId,
        uid: doc.id,
        title: doc["title"],
        thumbnailUrl: doc["thumbnailUrl"]);
  }
}
