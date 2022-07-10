import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/picture_model.dart';
import 'dart:ui' as ui;

import '../model/user_data.dart';
import '../providers/general_providers.dart';

abstract class BasePictureRepository {
  Stream<UserData?> get fetchPictureStream;
  Future<void> savePicture(Picture picture);
  Future<ByteData> exportToImage(GlobalKey globalKey);
}

class PictureRepository implements BasePictureRepository {
  final Ref ref;
  final String userId;
  CollectionReference? collectionReference;

  PictureRepository(this.ref, this.userId) {
    collectionReference =
        ref.read(firebaseFireStoreProvider).collection("picture");
  }

  UserData? pictureDataFromSnapshot(QuerySnapshot snapshot) {
    UserData user = UserData(uid: userId);

    user.data = snapshot.docs
        .map<Picture>((doc) => Picture.fromSnapshot(doc, userId))
        .toList();
    return user;
  }

  @override
  Stream<UserData?> get fetchPictureStream {
    return collectionReference!
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .map(pictureDataFromSnapshot);
  }

  @override
  Future<void> savePicture(Picture picture) async {
    // await exportToImage();
    collectionReference?.add({
      "user_id": userId,
      "title": picture.title,
      "thumbnailUrl":
          "https://images.goodsmile.info/cgm/images/product/20220518/12712/98900/large/10124cb51552e4c5b2a543db986e60bf.jpg",
    });
  }

  @override
  Future<ByteData> exportToImage(GlobalKey globalKey) async {
    final boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!;
  }
}
