import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';

@freezed
class Picture with _$Picture {
  const factory Picture({
    String? userId,
    String? uid,
    String? title,
    String? thumbnailUrl,
  }) = _Picture;

  factory Picture.fromSnapshot(DocumentSnapshot doc, String userId) {
    return Picture(
        userId: userId,
        uid: doc.id,
        title: doc["title"],
        thumbnailUrl: doc["thumbnailUrl"]);
  }
}
