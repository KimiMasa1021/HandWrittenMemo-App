import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/picture_model.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import '../model/user_data.dart';
import '../providers/general_providers.dart';
import 'package:flutter_share/flutter_share.dart';

abstract class BasePictureRepository {
  Stream<UserData?> get fetchPictureStream;
  Future<void> savePicture(Picture picture);
  Future<void> deletePicture(Picture uid);
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
/////////////////////////////
////////　データの取得

  //　リアルタイムに画像データを取得
  @override
  Stream<UserData?> get fetchPictureStream {
    return storeCollectionReference!
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .map(pictureDataFromSnapshot);
  }

/////////////////////////////
////////　データの保存

  // snapshot to UserData(data)
  UserData? pictureDataFromSnapshot(QuerySnapshot snapshot) {
    UserData user = UserData(uid: userId);

    user.data = snapshot.docs
        .map<Picture>((doc) => Picture.fromSnapshot(doc, userId))
        .toList();
    return user;
  }

  //　画像化するWidgetのkeyを取得
  void getDrawKey(GlobalKey val) {
    key = val;
    debugPrint(key.toString());
  }

  @override
  Future<void> savePicture(Picture picture) async {
    ByteData data = await exportToImage(key!);
    String url = await saveImage(data);
    await storeCollectionReference?.add({
      "user_id": userId,
      "title": picture.title,
      "thumbnailUrl": url,
    });
  }

  // key to bytedata
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
    String filename = '${DateTime.now()}.png';
    var imageFile = await convertByteDataToFile(pngBytes);
    String? url;
    try {
      await ref
          .watch(firebaseStoragePrvider)
          .ref()
          .child("todoList/$filename")
          .putFile(imageFile);
      url = await ref
          .watch(firebaseStoragePrvider)
          .ref()
          .child("todoList/$filename")
          .getDownloadURL();
    } on FirebaseException catch (e) {
      debugPrint("エラー${e.toString()}");
    }
    return url!;
  }

/////////////////////////////
////////　データの削除

  @override
  Future<void> deletePicture(Picture data) async {
    try {
      await storeCollectionReference!.doc(data.uid).delete();

      final storageReference =
          FirebaseStorage.instance.refFromURL(data.thumbnailUrl!);
      await storageReference.delete();
    } on FirebaseException catch (e) {
      debugPrint("エラー${e.toString()}");
    }
  }

// /////////////////////////////
// ////////　画像のダウンロード
//   Future<void> downloadFile(Picture data) async {
//     Dio dio = Dio();
//     try {
//       var dir = await getApplicationDocumentsDirectory();
//       final path = dir.path;
//       final directory = Directory('$path/picture/');
//       await directory.create(recursive: true);
//       await dio.download(
//           "https://i.ytimg.com/vi/wH-GfPUJHNQ/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBdy0F5QsDreEsKGJ9NhKrOGOPHgA",
//           "${dir.path}/${data.title}.png");
//       debugPrint("ダウンロード完了しました");
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// /////////////////////////////
// ////////　画像のシェア
  Future<void> shareImageAndText(GlobalKey globalKey) async {
    try {
      final ByteData bytes = await exportToImage(globalKey);
      final File file = await convertByteDataToFile(bytes);
      await FlutterShare.shareFile(
        title: "シェア機能テストです",
        filePath: file.path,
      );
    } catch (error) {
      debugPrint('シェア:$error');
    }
  }
}
