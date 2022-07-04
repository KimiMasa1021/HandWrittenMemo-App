import 'package:flutter/material.dart';
import 'PaintComponent/draw_screen.dart';
import 'PaintComponent/paint_operate.dart';

class PaintScreen extends StatelessWidget {
  const PaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "あああ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save_alt_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          DrawScreen(), //描画領域
          const PaintOperation(), //操作領域
        ],
      ),
    );
  }
}
