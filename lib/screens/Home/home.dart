import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/picture_model.dart';
import '../../common/common.dart';
import '../../controller/picture_controller.dart';
import '../../providers/general_providers.dart';
import '../paint/paint_screen.dart';
import 'home_grid.dart';
import 'home_nodata.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawState = ref.watch(pictureControllerProvider);
    final drawControl = ref.watch(drawControllerProvider.notifier);

    final homeState = ref.watch(homeControllerProvider);
    final homeControl = ref.watch(homeControllerProvider.notifier);

    final pictureRepository = ref.watch(pictureRepositoryProvider);

    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              drawControl.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaintScreen(),
                ),
              );
            },
            child: Row(
              children: const [
                Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  "絵を描く",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(width: 20)
              ],
            ),
          )
        ],
      ),

      // body
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: drawState?.data?.isNotEmpty ?? false
              ? HomeGrid(userPicture: drawState!)
              : const HomeNoData()),

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
                      return Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 2,
                              color: homeState.isTarget
                                  ? const Color.fromARGB(255, 255, 0, 0)
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.delete, size: 50),
                            const SizedBox(height: 5),
                            Text("ドロップで削除", style: textStyleBold20),
                            const SizedBox(height: 10),
                          ],
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
