import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/controller/draw_controller.dart';

import '../controller/auth_controller.dart';
import '../model/draw_state.dart';
import '../repository/auth_repository.dart';

//　FireBaseAuthのインスタンス
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
//　FireBaseFireStoreのインスタンス
final firebaseFireStoreProvider = Provider((ref) => FirebaseFirestore.instance);

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

final authControllerprovider =
    StateNotifierProvider((ref) => AuthController(ref.read));

final drawControllerProvider =
    StateNotifierProvider.autoDispose<DrawController, DrawState>(
        //autoDispose 画面遷移から戻ってきたときに値をリセットしてくれる自動で
        (ref) => DrawController());
