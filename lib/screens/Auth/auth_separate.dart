import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Auth/register.dart';
import 'package:zen03/screens/Auth/sign_in.dart';

class AuthSeparate extends HookConsumerWidget {
  const AuthSeparate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ChangeNotifierを継承
    //Valueを更新すると自動的にnotifylistenersが呼ばれる
    ValueNotifier<bool> showSignIn = useState(true);
    void toggleView() {
      showSignIn.value = !showSignIn.value;
    }

    if (showSignIn.value) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
