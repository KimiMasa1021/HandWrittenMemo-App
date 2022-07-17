import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import '../../providers/general_providers.dart';
import 'PaintComponent/paint_back_dialog.dart';
import 'PaintComponent/paint_save_dialog.dart';
import 'PaintComponent/paint_operate.dart';
import 'painter.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PaintScreen extends StatelessWidget {
  PaintScreen({Key? key, this.editPictureUrl}) : super(key: key) {
    //UnityADSの初期化設定
    UnityAds.init(
      testMode: true,
      gameId: '4842721',
      onComplete: () => debugPrint('Initialization Complete'),
      onFailed: (error, message) =>
          debugPrint('Initialization Failed: $error $message'),
    );
  }
  final _key = GlobalKey();
  final _imageKey = GlobalKey();
  String? editPictureUrl;
  @override
  Widget build(BuildContext context) {
    // ステータスバーとアップバーの高さを取得
    var appBarheight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PaintBackDialog();
          },
        );
        return false;
      },
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const PaintBackDialog();
                },
              );
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
                        return const PaintSaveDialog();
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
                      clipBehavior: Clip.hardEdge,
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
                          decoration: BoxDecoration(
                              image: editPictureUrl != null
                                  ? DecorationImage(
                                      image: NetworkImage(editPictureUrl!),
                                    )
                                  : null),
                          margin: const EdgeInsets.all(1),
                          child: Consumer(
                            builder: (context, ref, child) {
                              final paintController =
                                  ref.watch(drawControllerProvider.notifier);
                              final state = ref.watch(drawControllerProvider);

                              return state.isZoom
                                  ? GestureDetector(
                                      onPanStart: (details) {
                                        paintController
                                            .addPaint(details.localPosition);
                                      },
                                      onPanUpdate: (details) {
                                        paintController.updatePaint(
                                            _getPosition(
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
                                    )
                                  : InteractiveViewer(
                                      maxScale: 10,
                                      child: CustomPaint(
                                        painter: Painter(
                                          state: state,
                                          context: context,
                                        ),
                                      ),
                                      onInteractionStart: (val) => debugPrint(
                                        val.toString(),
                                      ),
                                      onInteractionUpdate: (val) => debugPrint(
                                        val.toString(),
                                      ),
                                      onInteractionEnd: (val) => debugPrint(
                                        val.toString(),
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
    double setd = 2;
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

// Transform(
//                                       transform:
//                                           Matrix4.translationValues(100, 1, 1),
//                                       child: CustomPaint(
//                                         painter: Painter(
//                                           state: state,
//                                           context: context,
//                                         ),
//                                       ),
//                                     );
