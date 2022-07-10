import 'package:flutter/material.dart';
import 'PaintComponent/draw_screen.dart';
import 'PaintComponent/paint_dialog.dart';
import 'PaintComponent/paint_operate.dart';

class PaintScreen extends StatelessWidget {
  const PaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ステータスバーとアップバーの高さを取得
    var appBarheight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "お絵描きメモ",
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const PaintDialog();
                },
              );
            },
            icon: const Icon(
              Icons.save_alt_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(), //スクロールを無効
        child: SizedBox(
          height: MediaQuery.of(context).size.height - appBarheight,
          child: Column(
            children: [
              DrawScreen(), //描画領域
              const PaintOperation(), //操作領域
            ],
          ),
        ),
      ),
    );
  }
}
