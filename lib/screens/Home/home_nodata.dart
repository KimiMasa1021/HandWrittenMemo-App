import 'package:flutter/cupertino.dart';

class HomeNoData extends StatelessWidget {
  const HomeNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("データがありません。"),
        Text("右下のボタンからついかしてみてね"),
      ],
    );
  }
}
