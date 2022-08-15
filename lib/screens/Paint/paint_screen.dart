import 'dart:io';

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
  PaintScreen({Key? key, this.editPictureUrl, this.assetsUrl, this.file})
      : super(key: key) {
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

    final pictureRepository = ref.watch(pictureRepositoryProvider);

    final PaintSetUpController =
        ref.watch(paintSetUpControllerProvider.notifier);
    final setUpState = ref.watch(paintSetUpControllerProvider);
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
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(192, 192, 192, 192),
                          ),
                          child: InteractiveViewer(
                            boundaryMargin:
                                const EdgeInsets.all(double.infinity),
                            panEnabled: false,
                            maxScale: 15,
                            minScale: 0.8,
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
                              child: RepaintBoundary(
                                key: _imageKey,
                                child: Container(
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
                                            ? DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  assetsUrl!,
                                                ),
                                              )
                                            : setUpState.type == "fromDevice"
                                                ? DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: FileImage(
                                                      setUpState.image!,
                                                    ),
                                                  )
                                                : null,
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
