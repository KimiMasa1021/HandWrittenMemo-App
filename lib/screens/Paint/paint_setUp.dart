import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/common.dart';
import '../../providers/general_providers.dart';

import 'paint_parts/paint_setup_back.dart';
import 'paint_parts/paint_setup_back2.dart';
import 'paint_parts/paint_setup_shape.dart';
import 'paint_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaintSetUp extends HookConsumerWidget {
  const PaintSetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final pictureRepository = ref.watch(pictureRepositoryProvider);
    final drawControl = ref.watch(drawControllerProvider.notifier);

    final state = ref.watch(paintSetUpControllerProvider);

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    100 -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        AppLocalizations.of(context)!.canvasBackGround,
                        style: textStyleBold20,
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Scrollbar(
                        thickness: 7,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(width: 10),
                            PaintSetUpBack(
                              title: AppLocalizations.of(context)!.whitePaper,
                            ),
                            PaintSetUpBack(
                              title: AppLocalizations.of(context)!.note,
                              img: "assets/back1.jpg",
                            ),
                            PaintSetUpBack(
                              title: AppLocalizations.of(context)!.frame,
                              img: "assets/back2.jpg",
                            ),
                            PaintSetUpBack(
                              title: AppLocalizations.of(context)!.flower1,
                              img: "assets/back3.jpg",
                            ),
                            PaintSetUpBack(
                              title: AppLocalizations.of(context)!.flower2,
                              img: "assets/back4.jpg",
                            ),
                            const PaintSetUpBack2(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        AppLocalizations.of(context)!.canvasShape,
                        style: textStyleBold20,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Scrollbar(
                          thickness: 7,
                          child: ListView(
                            children: [
                              const PaintSetUpShape(
                                title: "１：１",
                                width: 768,
                                height: 768,
                              ),
                              const PaintSetUpShape(
                                title: "３：４",
                                width: 768,
                                height: 1024,
                              ),
                              const PaintSetUpShape(
                                title: "９：１６",
                                width: 720,
                                height: 1280,
                              ),
                              PaintSetUpShape(
                                title:
                                    AppLocalizations.of(context)!.twitterHeader,
                                width: 1500,
                                height: 500,
                              ),
                              PaintSetUpShape(
                                title:
                                    AppLocalizations.of(context)!.pcWallpaper,
                                width: 1920,
                                height: 1080,
                              ),
                              PaintSetUpShape(
                                title: AppLocalizations.of(context)!.lineStamp,
                                width: 370,
                                height: 320,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    width: size.width / 3,
                    height: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.back,
                        style: textStyleBold20,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    width: size.width * 2 / 3,
                    height: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return state.type != "fromDevice"
                                  ? PaintScreen(
                                      assetsUrl: state.type,
                                    )
                                  : PaintScreen(
                                      file: state.image,
                                    );
                            },
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.decision,
                        style: textStyleBold20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
