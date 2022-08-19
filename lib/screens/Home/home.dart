import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/common.dart';
import '../../controller/picture_controller.dart';
import '../../model/picture_model.dart';
import '../../providers/general_providers.dart';
import '../Paint/paint_setup.dart';
import '../Setting/setting.dart';
import 'home_grid.dart';
import 'home_nodata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawState = ref.watch(pictureControllerProvider);
    final drawControl = ref.watch(drawControllerProvider.notifier);

    final homeState = ref.watch(homeControllerProvider);
    final homeControl = ref.watch(homeControllerProvider.notifier);

    final pictureRepository = ref.watch(pictureRepositoryProvider);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color.fromARGB(255, 210, 210, 210),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: drawState?.data?.isNotEmpty ?? false
                    ? HomeGrid(userPicture: drawState!)
                    : const HomeNoData(),
              ),
            ),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                // InkWell(
                //   onTap: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const Setting(),
                //     ),
                //   ),
                //   child: Container(
                //     padding:
                //         const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                //     height: 100,
                //     child: const Center(
                //       child: Icon(
                //         Icons.settings,
                //         size: 60,
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
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
                            // builder: (context) => PaintScreen(),
                            builder: (context) => const PaintSetUp(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.newCanvas,
                        style: textStyleBold20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //floatingButton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: homeState.isDrag == true
          ? Stack(
              children: [
                Align(
                  alignment: const Alignment(0, 1),
                  child: DragTarget(
                    hitTestBehavior: HitTestBehavior.deferToChild,
                    onWillAccept: (val) {
                      homeControl.changeDeleteTaget();
                      return true;
                    },
                    onAccept: (val) async {
                      homeControl.changeDeleteTaget();
                      pictureRepository.deletePicture(val as Picture);
                    },
                    onLeave: (val) {
                      homeControl.changeDeleteTaget();
                    },
                    builder: (BuildContext context, List<Object?> candidateData,
                        List<dynamic> rejectedData) {
                      return DottedBorder(
                        color: homeState.isTarget
                            ? const Color.fromARGB(255, 255, 0, 0)
                            : const Color.fromARGB(255, 0, 0, 0),
                        dashPattern: const [15.0, 6.0],
                        strokeWidth: 3.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 120,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.delete, size: 50),
                              const SizedBox(height: 5),
                              Text(AppLocalizations.of(context)!.drop,
                                  style: textStyleBold20),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
