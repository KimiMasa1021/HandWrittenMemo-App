import 'dart:io';
import 'dart:math';

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
}

class PictureRepository implements BasePictureRepository {
  final Ref ref;
  final String userId;
  CollectionReference? storeCollectionReference;
  GlobalKey? key;

  PictureRepository(this.ref, this.userId) {
    storeCollectionReference =
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
    return storeCollectionReference!
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .map(pictureDataFromSnapshot);
  }

  void getDrawKey(GlobalKey val) {
    //グローバルキーの取得
    key = val;
    debugPrint(key.toString());
  }

  @override
  Future<void> savePicture(Picture picture) async {
    //firebaseに保存
    File file = await exportToImage();
    String url = await saveImage(file);
    await storeCollectionReference?.add({
      "user_id": userId,
      "title": picture.title,
      "thumbnailUrl": url,
    });
  }

  Future<File> exportToImage() async {
    //Widgetの画像化
    final boundary =
        key!.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    //変換　bytedata → File
    var pngBytes = byteData!.buffer.asUint8List();
    File file = File.fromRawPath(pngBytes);
    return file;
  }

  Future<String> saveImage(File file) async {
    final date = DateTime.now();
    var filename = date.toString();

    try {
      await ref
          .watch(firebaseStoragePrvider)
          .ref()
          .child("todoList/$filename")
          .putFile(file);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }

    return filename;
  }

  String generateNonce([int length = 10]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    final randomStr =
        List.generate(length, (_) => charset[random.nextInt(charset.length)])
            .join();
    return randomStr;
  }
}
