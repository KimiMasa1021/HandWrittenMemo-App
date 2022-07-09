import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/picture_state.dart';
import 'package:zen03/model/user_data.dart';
import 'package:zen03/model/user_model.dart';

import '../providers/general_providers.dart';

abstract class BasePictureRepository {
  Stream<PictureState?>? get getPictureState;
}

class PictureRepository implements BasePictureRepository {
  final Ref ref;
  final String userId;
  CollectionReference? collectionReference;

  PictureRepository(this.ref, this.userId) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("picture");
  }

  PictureState? _DataFromSnapshot(QuerySnapshot snapshot) {
    UserData user = UserData(uid: userId);
    user.data = snapshot.docs
        .map<PictureState>((snap) => PictureState.fromSnapshot(snap, userId))
        .toList();
    if (user.data != null) {
      user.data?.forEach((picture) {
        String? uid = picture.uid;
      });
    }
  }

  @override
  Stream<PictureState?> get getPictureState {
    return collectionReference!
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .map(_DataFromSnapshot);
  }
}
