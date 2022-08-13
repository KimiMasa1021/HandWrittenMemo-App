import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:zen03/model/data_path.dart';
import 'package:zen03/screens/Paint/paint_back_dialog.dart';
import 'package:zen03/screens/Paint/paint_save_dialog.dart';
import '../../providers/general_providers.dart';
import 'paint_operate.dart';
import 'painter.dart';

class PaintScreen extends HookConsumerWidget {
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
  DataPath? path;
  Size? size;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ステータスバーとアップバーの高さを取得
    // var appBarheight =
    //     AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    var appBarheight = MediaQuery.of(context).padding.top;

    final paintController = ref.watch(drawControllerProvider.notifier);
    final state = ref.watch(drawControllerProvider);

    final moveController = ref.watch(drawMoveController.notifier);
    final moveState = ref.watch(drawMoveController);

    final pictureRepository = ref.watch(pictureRepositoryProvider);
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
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(), //スクロールを無効
            child: SizedBox(
              height: MediaQuery.of(context).size.height - appBarheight,
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(192, 192, 192, 192),
                            ),
                            child: Transform.translate(
                              offset: moveController.getOffset(),
                              child: Transform.scale(
                                alignment: moveState.align,
                                scale: moveState.scale,
                                child: XGestureDetector(
                                  onMoveStart: (details) {
                                    path = DataPath(
                                      color: state.pickColor,
                                      thickness: state.thickness,
                                    );
                                    paintController.startPath(
                                      details.localPos,
                                      path!,
                                    );
                                    state.drawPath?.path.moveTo(
                                      details.localPos.dx,
                                      details.localPos.dx,
                                    );
                                  },
                                  onMoveUpdate: (details) {
                                    paintController.updatePath(
                                      paintController.getPosition(
                                        _key.currentContext!.size,
                                        details.localPos,
                                      ),
                                      path!,
                                    );
                                  },
                                  onMoveEnd: (details) {
                                    paintController.savePath(path!);
                                  },
                                  onScaleStart: (details) {
                                    size = _key.currentContext!.size!;
                                    moveController.scaleStartCalculate(
                                      details,
                                      size!,
                                    );
                                  },
                                  onScaleUpdate: (details) {
                                    moveController.scaleUpdateCalculate(
                                      details,
                                    );
                                  },
                                  onScaleEnd: () {
                                    moveController.scaleEndCalculate();
                                  },
                                  child: RepaintBoundary(
                                    key: _imageKey,
                                    child: Container(
                                      key: _key,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        image: editPictureUrl != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                  editPictureUrl!,
                                                ),
                                              )
                                            : const DecorationImage(
                                                image: AssetImage(
                                                    "assets/note.jpg")),
                                        color: Colors.white,
                                      ),
                                      child: CustomPaint(
                                        painter: Painter(
                                          state: state,
                                          context: context,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    pictureRepository.getDrawKey(_imageKey);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const PaintSaveDialog();
                                      },
                                    );
                                  },
                                  padding: const EdgeInsets.only(left: 10),
                                  icon: const Icon(
                                    Icons.save_as_outlined,
                                    color: Colors.black,
                                    size: 45,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    paintController.clear();
                                  },
                                  padding: const EdgeInsets.only(right: 10),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                    size: 45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //描画領域
                  PaintOperation(), //操作領域
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
                      // onScaleStart: (ScaleStartDetails details) {
                      //   initialForcalPoint.value = details.focalPoint;
                      //   initialScale.value = scale.value;
                      // },
                      // onScaleUpdate: (details) {
                      //   sessionOffset.value =
                      //       details.focalPoint - initialForcalPoint.value;
                      //   scale.value = initialScale.value * details.scale;
                      // },
                      // onScaleEnd: (details) {
                      //   offset.value += sessionOffset.value;
                      //   sessionOffset.value = Offset.zero;
                      // },