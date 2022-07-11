import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/general_providers.dart';
import 'PaintComponent/paint_dialog.dart';
import 'PaintComponent/paint_operate.dart';
import 'painter.dart';

class PaintScreen extends StatelessWidget {
  PaintScreen({Key? key}) : super(key: key);
  final _key = GlobalKey();
  final _imageKey = GlobalKey();
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
          Consumer(builder: (context, ref, child) {
            final pictureRepository = ref.watch(pictureRepositoryProvider);
            return IconButton(
              onPressed: () {
                pictureRepository.getDrawKey(_imageKey);
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
            );
          })
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(), //スクロールを無効
        child: SizedBox(
          height: MediaQuery.of(context).size.height - appBarheight,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: RepaintBoundary(
                    key: _imageKey,
                    child: Container(
                      key: _key,
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final paintController =
                              ref.watch(drawControllerProvider.notifier);
                          final state = ref.watch(drawControllerProvider);

                          return GestureDetector(
                            onPanStart: (details) {
                              paintController.addPaint(details.localPosition);
                            },
                            onPanUpdate: (details) {
                              paintController.updatePaint(_getPosition(
                                  _key.currentContext!.size,
                                  details.localPosition));
                            },
                            onPanEnd: (details) {
                              paintController.endPaint();
                            },
                            child: CustomPaint(
                              painter: Painter(
                                state: state,
                                context: context,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ), //描画領域
              const PaintOperation(), //操作領域
            ],
          ),
        ),
      ),
    );
  }

  Offset _getPosition(Size? length, Offset localPosition) {
    double dx;
    double dy;
    if (localPosition.dx < 0) {
      dx = 0;
    } else if (localPosition.dx > length!.width) {
      dx = length.width;
    } else {
      dx = localPosition.dx;
    }
    if (localPosition.dy < 0) {
      dy = 0;
    } else if (localPosition.dy > length!.height) {
      dy = length.height;
    } else {
      dy = localPosition.dy;
    }
    return Offset(dx, dy);
  }
}
