import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/picture_model.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
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
    ByteData data = await exportToImage(key!);
    String url = await saveImage(data);
    await storeCollectionReference?.add({
      "user_id": userId,
      "title": picture.title,
      "thumbnailUrl": url,
    });
  }

  Future exportToImage(GlobalKey globalKey) async {
    final boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final imge = await boundary.toImage(
      pixelRatio: 3,
    );
    final byteData = await imge.toByteData(format: ui.ImageByteFormat.png);
    return byteData;
  }

  Future<String> get getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> convertByteDataToFile(ByteData data) async {
    final path = await getLocalPath;
    final imagePath = '$path/image.png';
    File imageFile = File(imagePath);

    final buffer = data.buffer;
    final localFile = await imageFile.writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    return localFile;
  }

  Future<String> saveImage(ByteData pngBytes) async {
    String filename = "testfile.png"; //DateTime.now().toString();
    var imageFile = await convertByteDataToFile(pngBytes);

    try {
      await ref
          .watch(firebaseStoragePrvider)
          .ref()
          .child("todoList/$filename")
          .putFile(imageFile);
    } on FirebaseException catch (e) {
      debugPrint("エラー${e.toString()}");
    }

    return filename;
  }
}
