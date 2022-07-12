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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Consumer(
              builder: (context, ref, child) {
                final pictureRepository = ref.watch(pictureRepositoryProvider);
                return InkWell(
                  onTap: () {
                    pictureRepository.getDrawKey(_imageKey);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const PaintDialog();
                      },
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.save_alt_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "保存する",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                );
              },
            )
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
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1),
                      ),
                      child: RepaintBoundary(
                        key: _imageKey,
                        child: Container(
                          key: _key,
                          margin: const EdgeInsets.all(4),
                          child: Consumer(
                            builder: (context, ref, child) {
                              final paintController =
                                  ref.watch(drawControllerProvider.notifier);
                              final state = ref.watch(drawControllerProvider);

                              return GestureDetector(
                                onPanStart: (details) {
                                  paintController
                                      .addPaint(details.localPosition);
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
                  ),
                ), //描画領域
                const PaintOperation(), //操作領域
              ],
            ),
          ),
        ),
      ),
    );
  }

  Offset _getPosition(Size? length, Offset localPosition) {
    double dx;
    double dy;
    double setd = 8;
    if (localPosition.dx < 0) {
      dx = 0;
    } else if (localPosition.dx > (length!.width - setd)) {
      dx = length.width - setd;
    } else {
      dx = localPosition.dx;
    }
    if (localPosition.dy < 0) {
      dy = 0;
    } else if (localPosition.dy > (length!.height - setd)) {
      dy = length.height - setd;
    } else {
      dy = localPosition.dy;
    }
    return Offset(dx, dy);
  }
}
