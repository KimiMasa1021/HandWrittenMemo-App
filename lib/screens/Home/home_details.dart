import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:zen03/model/picture_model.dart';
import '../../common/common.dart';
import '../../providers/general_providers.dart';
import '../Paint/paint_screen.dart';
import 'home_details_button.dart';

class PictureDetails extends HookConsumerWidget {
  PictureDetails({Key? key, required this.data}) : super(key: key) {
    //UnityADSの初期化設定
    UnityAds.init(
      testMode: true,
      gameId: '4842721',
      onComplete: () => debugPrint('Initialization Complete'),
      onFailed: (error, message) =>
          debugPrint('Initialization Failed: $error $message'),
    );
  }
  final Picture data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictureRepository = ref.watch(pictureRepositoryProvider);
    final drawControl = ref.watch(drawControllerProvider.notifier);

    final pictureRepositry = ref.watch(pictureRepositoryProvider);

    final shareKey = GlobalKey();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(gradient: gradation01),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UnityBannerAd(
                  placementId: 'Banner_Ad_Android',
                  onLoad: (placementId) =>
                      debugPrint('Banner loaded: $placementId'),
                  onClick: (placementId) =>
                      debugPrint('Banner clicked: $placementId'),
                  onFailed: (placementId, error, message) => debugPrint(
                      'Banner Ad $placementId failed: $error $message'),
                ),
                RepaintBoundary(
                  key: shareKey,
                  child: Container(
                    decoration: BoxDecoration(gradient: gradation02),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(data.title!, style: textStyleBold40),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 10,
                            child: Image.network(
                              data.thumbnailUrl!,
                              loadingBuilder: (_, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const SizedBox(
                                  height: 450,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                HomeDetailsButton(
                  text: "画像を共有する",
                  buttonIcon: const Icon(Icons.share),
                  function: () async {
                    await pictureRepositry.shareImageAndText(shareKey);
                  },
                ),
                HomeDetailsButton(
                  text: "書き加える",
                  buttonIcon: const Icon(Icons.brush),
                  function: () {
                    drawControl.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PaintScreen(
                                editPictureUrl: data.thumbnailUrl)));
                  },
                ),
                HomeDetailsButton(
                  text: "削除する",
                  buttonIcon: const Icon(Icons.delete),
                  function: () {
                    pictureRepository.deletePicture(data);
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                UnityBannerAd(
                  placementId: 'Banner_Ad_Android',
                  onLoad: (placementId) =>
                      debugPrint('Banner loaded: $placementId'),
                  onClick: (placementId) =>
                      debugPrint('Banner clicked: $placementId'),
                  onFailed: (placementId, error, message) => debugPrint(
                      'Banner Ad $placementId failed: $error $message'),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
