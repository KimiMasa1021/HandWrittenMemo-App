import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:zen03/model/picture_model.dart';

import '../../../providers/general_providers.dart';
import '../Home/home.dart';

class PaintSaveDialog extends HookConsumerWidget {
  const PaintSaveDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useState("");

    final pictureRepository = ref.watch(pictureRepositoryProvider);
    return Stack(
      children: [
        AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, //　ダイアログの高さをコンテンツに合わせる。
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(200, 102, 191, 191),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "絵に名前をつけよう。",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: TextField(
                  onChanged: (val) => title.value = val,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: "なまえ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () async {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (BuildContext context, Animation animetion,
                          Animation secondaryAnimation) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    await pictureRepository.savePicture(
                      Picture(
                        title: title.value,
                      ),
                    );
                    await UnityAds.load(
                      placementId: 'Interstitial_Ad_Android',
                      onComplete: (placementId) =>
                          debugPrint('Load Complete $placementId'),
                      onFailed: (placementId, error, message) => debugPrint(
                          'Load Failed $placementId: $error $message'),
                    );
                    await UnityAds.showVideoAd(
                      placementId: 'Interstitial_Ad_Android',
                      onComplete: (placementId) =>
                          debugPrint('Load Complete $placementId'),
                      onFailed: (placementId, error, message) => debugPrint(
                          'Load Failed $placementId: $error $message'),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(199, 191, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    elevation: 15.0,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '完了',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
