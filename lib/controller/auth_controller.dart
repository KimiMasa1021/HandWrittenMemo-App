import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/user_model.dart';
import '../providers/general_providers.dart';

class AuthController extends StateNotifier<UserModel?> {
  final Reader _reader;

  StreamSubscription<UserModel?>? _authStateChangesSubscription;

  AuthController(this._reader) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _reader(authRepositoryProvider)
        .authStateChange
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }
}
