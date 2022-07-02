import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/common/common.dart';

class MyTextField extends HookConsumerWidget {
  final bool pwdText;
  final ValueNotifier<String> data;
  const MyTextField({Key? key, required this.pwdText, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> visibilityFlg = useState(false);

    return SizedBox(
      height: 60,
      child: TextFormField(
        onChanged: (val) {
          data.value = val;
        },
        textAlignVertical: TextAlignVertical.center,
        obscureText: pwdText && !visibilityFlg.value ? true : false,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          suffixIcon: pwdText
              ? IconButton(
                  onPressed: () {
                    visibilityFlg.value = !visibilityFlg.value;
                  },
                  icon: visibilityFlg.value
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null,
          contentPadding: const EdgeInsets.all(20.0),
          focusColor: Colors.black,
          fillColor: Colors.white,
          border: textInputDecoration,
          focusedBorder: textInputDecoration,
        ),
      ),
    );
  }
}
