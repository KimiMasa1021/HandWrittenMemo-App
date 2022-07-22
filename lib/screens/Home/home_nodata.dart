import 'package:flutter/material.dart';

class HomeNoData extends StatelessWidget {
  const HomeNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage("assets/tutorial.png"),
        ),
      ),
    );
  }
}
