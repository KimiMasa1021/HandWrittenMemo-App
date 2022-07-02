import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/common/shared/loading.dart';
import 'package:zen03/providers/general_providers.dart';

import '../../common/common.dart';
import '../../common/shared/my_textfield.dart';

class Register extends HookConsumerWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final password = useState("");
    final email = useState(""); //かっこに初期値を描く
    final loadingFlg = useState(false);

    void trySingIn() async {
      loadingFlg.value = true;
      dynamic result = await ref
          .read(authRepositoryProvider)
          .signUpEmailAndPassword(email.value, password.value);
      if (result == null) debugPrint("エラー");
      loadingFlg.value = false;
    }

    return loadingFlg.value
        ? const Loading()
        : SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 15,
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: size.height * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text("新規登録", style: textStyleBold40),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Text("メールアドレス", style: textStyleBold20),
                                MyTextField(pwdText: false, data: email),
                                const SizedBox(height: 15),
                                Text("パスワード", style: textStyleBold20),
                                MyTextField(pwdText: true, data: password),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  trySingIn();
                                },
                                child: Container(
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(width: 2)),
                                  child: const Center(
                                    child: Text(
                                      "登録",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  children: [
                                    const TextSpan(text: "登録済みの方は"),
                                    TextSpan(
                                      text: "こちら",
                                      style: const TextStyle(
                                          color: Colors.blueAccent),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          toggleView();
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
