import 'package:flutter/material.dart';
import 'package:zen03/screens/Home/home.dart';

import '../../../common/common.dart';

class PaintBackDialog extends StatelessWidget {
  const PaintBackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, //　ダイアログの高さをコンテンツに合わせる。
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
              color: Color.fromARGB(200, 102, 191, 191),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: const Center(
              child: Text(
                "ホームにもどる",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Text("もどると絵が消えますがよろしいですか？？", style: textStyleBold20),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("キャンセル", style: textStyleNomal20)),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen())),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("OK", style: textStyleBold20),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
