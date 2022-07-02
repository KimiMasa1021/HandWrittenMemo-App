import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/providers/general_providers.dart';

import '../model/user_model.dart';

abstract class BaseAuthRepository {
  Stream<UserModel?> get authStateChange;
  Future<dynamic> signUpEmailAndPassword(String email, String password);
  Future<dynamic> signInEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class AuthRepository implements BaseAuthRepository {
  final Reader _reader;

  const AuthRepository(this._reader);

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  @override
  Stream<UserModel?> get authStateChange => _reader(firebaseAuthProvider)
      .authStateChanges() //ユーザーのログイン状況を取得
      .map(_userFromFirebaseUser);

  @override
  Future<dynamic> signUpEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _reader(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<dynamic> signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _reader(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _reader(firebaseAuthProvider).signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
