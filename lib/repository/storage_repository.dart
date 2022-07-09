import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/providers/general_providers.dart';

abstract class BaseStorageRepository {}

class StorageRepository implements BaseStorageRepository {
  final Ref ref;
  final String userId;
  CollectionReference? imageCollection;
  StorageRepository(this.ref, this.userId) {
    imageCollection =
        ref.read(firebaseFireStoreProvider).collection("pictureImage");
  }

  Future<String> getPictureUrl(String pictureId) async {
    String url;
    await imageCollection!
        .where("picture_id", isEqualTo: pictureId)
        .get()
        .then((doc) => url = doc.docs.);
  }
}
