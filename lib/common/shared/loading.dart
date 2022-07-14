import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../common.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("読み込み中です...", style: textStyleBold20),
            const SpinKitFadingCircle(
              color: Colors.red,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
