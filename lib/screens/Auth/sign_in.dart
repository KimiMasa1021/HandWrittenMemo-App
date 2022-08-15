import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/common/shared/loading.dart';
import 'package:zen03/providers/general_providers.dart';

import '../../common/common.dart';
import '../../common/shared/my_textfield.dart';

class SignIn extends HookConsumerWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final password = useState("");
    final email = useState(""); //かっこに初期値を描く
    final loadingFlg = useState(false);
    final err = useState("");

    void trySignIn() {
      loadingFlg.value = true;
      ref
          .read(authRepositoryProvider)
          .signInEmailAndPassword(email.value, password.value);
      err.value = "エラーが発生しました。";
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                child: Image(
                                  width: 50,
                                  height: 50,
                                  image: AssetImage("assets/cat.png"),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text("ログイン", style: textStyleBold40),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                "メールアドレス",
                                style: textStyleBold20,
                              ),
                              MyTextField(
                                pwdText: false,
                                data: email,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "パスワード",
                                style: textStyleBold20,
                              ),
                              MyTextField(
                                pwdText: true,
                                data: password,
                              ),
                              Text(
                                err.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  trySignIn();
                                },
                                child: Container(
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(width: 2)),
                                  child: const Center(
                                    child: Text(
                                      "ログイン",
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
                                    const TextSpan(text: "初めてご利用の方は"),
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
