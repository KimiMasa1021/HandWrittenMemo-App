import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:zen03/model/data_path.dart';
import 'package:zen03/screens/Paint/paint_dialog/paint_back_dialog.dart';
import '../../providers/general_providers.dart';
import 'paint_dialog/paint_menu_dialog.dart';
import 'paint_dialog/paint_thickness_dialog.dart';
import 'paint_parts/paint_operate.dart';
import 'paint_parts/painter.dart';

class PaintScreen extends HookConsumerWidget {
  PaintScreen({
    Key? key,
    this.editPictureUrl,
    this.assetsUrl,
    this.file,
    this.canvasSize,
  }) : super(key: key) {
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
  String? assetsUrl;
  Size? canvasSize;
  File? file;
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

    final setUpState = ref.watch(paintSetUpControllerProvider);

    size = MediaQuery.of(context).size;
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
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - appBarheight,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(192, 192, 192, 192),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const Alignment(0, 0),
                                child: InteractiveViewer(
                                  constrained: false,
                                  clipBehavior: Clip.none,
                                  boundaryMargin:
                                      const EdgeInsets.all(double.infinity),
                                  panEnabled: false,
                                  maxScale: 50,
                                  minScale: 0.1,
                                  child: XGestureDetector(
                                    onTap: (details) {
                                      path = DataPath(
                                        color: state.pickColor,
                                        thickness: state.thickness,
                                        firstPoint: Offset(details.localPos.dx,
                                            details.localPos.dy),
                                      );
                                      paintController.startPath(
                                        details.localPos,
                                        path!,
                                      );
                                      paintController.savePath(path!);
                                    },
                                    onMoveStart: (details) {
                                      path = DataPath(
                                        color: state.pickColor,
                                        thickness: state.thickness,
                                        firstPoint: Offset(details.localPos.dx,
                                            details.localPos.dy),
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
                                    onScaleStart: (details) {},
                                    child: RepaintBoundary(
                                      key: _imageKey,
                                      child: Container(
                                        width: canvasSize?.width ??
                                            setUpState.width,
                                        height: canvasSize?.height ??
                                            setUpState.height,
                                        key: _key,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          image: editPictureUrl != null
                                              ? DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    editPictureUrl!,
                                                  ),
                                                )
                                              : setUpState.type != "fromDevice"
                                                  ? assetsUrl != ""
                                                      ? DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            assetsUrl!,
                                                          ),
                                                        )
                                                      : null
                                                  : DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                        setUpState.image!,
                                                      ),
                                                    ),
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
                            ],
                          ),
                        ),
                      ), //描画領域
                      const PaintOperation(), //操作領域
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        paintController.undo();
                      },
                      child: const Icon(
                        Icons.replay,
                        size: 45,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        paintController.redo();
                      },
                      child: const Icon(
                        Icons.refresh,
                        size: 45,
                      ),
                    ),
                  ],
                ),
                // //ペンの太さのプレビュー表示
                // state.isOption
                //     ? Positioned(
                //         bottom: 170.0,
                //         left: 5.0,
                //         width: MediaQuery.of(context).size.width - 5,
                //         height: 100.0,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               width: state.thickness,
                //               height: state.thickness,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 border: Border.all(),
                //               ),
                //             )
                //           ],
                //         ),
                //       )
                //     : const SizedBox(),
                PaintMenuDialog(imageKey: _imageKey),
                const PaintThicknessDialog()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
