import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Paint/paint_screen.dart';

import '../../common/common.dart';
import '../../providers/general_providers.dart';
import 'paint_setup_back.dart';
import 'paint_setup_back2.dart';

class PaintSetUp extends HookConsumerWidget {
  const PaintSetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictureRepository = ref.watch(pictureRepositoryProvider);
    final drawControl = ref.watch(drawControllerProvider.notifier);

    final PaintSetUpController =
        ref.watch(paintSetUpControllerProvider.notifier);
    final state = ref.watch(paintSetUpControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "新規キャンバス",
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "キャンバスの背景",
                style: textStyleBold20,
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 10),
                  PaintSetUpBack(
                    title: "白紙",
                  ),
                  PaintSetUpBack(
                    title: "額縁",
                    img: "assets/back1.jpg",
                  ),
                  PaintSetUpBack(
                    title: "お花１",
                    img: "assets/back2.jpg",
                  ),
                  PaintSetUpBack(
                    title: "お花２",
                    img: "assets/back3.jpg",
                  ),
                  PaintSetUpBack(
                    title: "お花３",
                    img: "assets/back4.jpg",
                  ),
                  const PaintSetUpBack2(),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                onPressed: () {
                  drawControl.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return state.type != "fromDevice"
                        ? PaintScreen(assetsUrl: state.type)
                        : PaintScreen(file: state.image);
                  }));
                },
                child: const Text('OK')),
          ],
        ),
      ),
    );
  }
}
