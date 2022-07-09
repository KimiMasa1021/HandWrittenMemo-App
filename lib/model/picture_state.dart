import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_state.freezed.dart';

@freezed
class PictureState with _$PictureState {
  const factory PictureState({
    String? userId,
    String? uid,
    DateTime? createAt,
    String? title,
    String? thumbnailUrl,
  }) = _PictureState;

  factory PictureState.fromSnapshot(DocumentSnapshot doc, String userId) {
    return PictureState(
      userId: userId,
      uid: doc.id,
      createAt: doc['createdAt'],
      title: doc['title'],
      thumbnailUrl: doc['thumbnailUrl'],
    );
  }
}
