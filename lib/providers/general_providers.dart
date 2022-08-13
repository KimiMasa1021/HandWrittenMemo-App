import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/controller/draw_controller.dart';
import 'package:zen03/controller/home_controller.dart';
import 'package:zen03/model/user_model.dart';
import 'package:zen03/repository/picture_repository.dart';

import '../controller/auth_controller.dart';
import '../controller/draw_move_controller.dart';
import '../model/draw_move_state.dart';
import '../model/draw_state.dart';
import '../model/home_state.dart';
import '../repository/auth_repository.dart';

//　FireBaseAuthのインスタンス
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
//　FireBaseFireStoreのインスタンス
final firebaseFireStoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseStoragePrvider =
    Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

final authControllerprovider =
    StateNotifierProvider<AuthController, UserModel?>(
        (ref) => AuthController(ref.read));

final drawControllerProvider =
    StateNotifierProvider.autoDispose<DrawController, DrawState>(
        //autoDispose 画面遷移から戻ってきたときに値をリセットしてくれる自動で
        (ref) => DrawController());
final drawMoveController =
    StateNotifierProvider.autoDispose<DrawMoveController, DrawMoveState>(
        (ref) => DrawMoveController());
final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) => HomeController());

final pictureRepositoryProvider = Provider<PictureRepository>(
  (ref) => PictureRepository(ref, ref.watch(authControllerprovider)?.uid ?? ''),
);
