import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/auth_controller.dart';
import '../repository/auth_repository.dart';

//　FireBaseAuthのインスタンス
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
//　FireBaseFireStoreのインスタンス
final firebaseFireStoreProvider = Provider((ref) => FirebaseFirestore.instance);

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

final authControllerprovider =
    StateNotifierProvider((ref) => AuthController(ref.read));
