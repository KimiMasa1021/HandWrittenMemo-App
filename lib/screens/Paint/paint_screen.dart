import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:zoom_widget/zoom_widget.dart';
import '../../providers/general_providers.dart';
import 'PaintComponent/paint_back_dialog.dart';
import 'PaintComponent/paint_save_dialog.dart';
import 'PaintComponent/paint_operate.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ステータスバーとアップバーの高さを取得
    var appBarheight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;

    ValueNotifier<Offset> offset = useState(Offset.zero);
    ValueNotifier<Offset> initialForcalPOint = useState(Offset.zero);
    ValueNotifier<Offset> sessionOffset = useState(Offset.zero);

    ValueNotifier<double> scale = useState(1.0);
    ValueNotifier<double> initialScale = useState(1.0);

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

                              return !state.isZoom
                                  ? GestureDetector(
                                      onPanStart: (details) {
                                        paintController.addPaint(
                                            paintController.correctionPostion1(
                                                details.localPosition,
                                                offset.value +
                                                    sessionOffset.value));
                                      },
                                      onPanUpdate: (details) {
                                        paintController.updatePaint(
                                            paintController.correctionPostion2(
                                                _getPosition(
                                                    _key.currentContext!.size,
                                                    details.localPosition),
                                                offset.value +
                                                    sessionOffset.value,
                                                scale.value));
                                      },
                                      onPanEnd: (details) {
                                        paintController.endPaint();
                                      },
                                      child: Transform.translate(
                                        offset:
                                            offset.value + sessionOffset.value,
                                        child: Transform.scale(
                                          scale: scale.value,
                                          child: CustomPaint(
                                            painter: Painter(
                                              state: state,
                                              context: context,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onScaleStart:
                                          (ScaleStartDetails details) {
                                        initialForcalPOint.value =
                                            details.focalPoint;
                                        initialScale.value = scale.value;
                                      },
                                      onScaleUpdate: (details) {
                                        sessionOffset.value =
                                            details.focalPoint -
                                                initialForcalPOint.value;
                                        scale.value =
                                            initialScale.value * details.scale;
                                      },
                                      onScaleEnd: (details) {
                                        offset.value += sessionOffset.value;
                                        sessionOffset.value = Offset.zero;
                                      },
                                      child: Transform.translate(
                                        offset:
                                            offset.value + sessionOffset.value,
                                        child: Transform.scale(
                                          scale: scale.value,
                                          child: CustomPaint(
                                            painter: Painter(
                                              state: state,
                                              context: context,
                                            ),
                                          ),
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
