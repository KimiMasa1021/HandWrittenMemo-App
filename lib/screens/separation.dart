import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/general_providers.dart';
import 'Auth/auth_separate.dart';
import 'Home/home.dart';

class Separation extends HookConsumerWidget {
  const Separation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authControllerState = ref.watch(authControllerprovider);

    if (authControllerState == null) {
      return const AuthSeparate();
    } else {
      return const HomeScreen();
    }
  }
}
