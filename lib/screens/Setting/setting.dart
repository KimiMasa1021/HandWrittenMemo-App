import 'package:flutter/material.dart';

import '../../common/common.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("設定", style: textStyleBold30),
            ],
          ),
        ),
      ),
    );
  }
}
