import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final userPicture = ref.watch(pictureControllerProvider);
    final drawControl = ref.watch(drawControllerProvider.notifier);

    final homeState = ref.watch(homeControllerProvider);
    final homeControl = ref.watch(homeControllerProvider.notifier);

    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text(
          "手書きメモ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              drawControl.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaintScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.photo_size_select_actual_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),

      // body
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: userPicture?.data?.isNotEmpty ?? false
              ? HomeGrid(userPicture: userPicture!)
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
                      return true;
                    },
                    // onAccept: (val) {
                    // },
                    onLeave: (val) {},
                    builder: (BuildContext context, List<Object?> candidateData,
                        List<dynamic> rejectedData) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 2),
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

// DragTarget(
//               hitTestBehavior: HitTestBehavior.deferToChild,
//               onWillAccept: (val) {
//                 // homeControl.changeWillAccept();
//                 return true;
//               },
//               onAccept: (val) {
//                 homeControl.changeWillAccept();
//                 homeControl.changeFeedBackCardWidth();
//               },
//               onLeave: (val) {
//                 homeControl.changeWillAccept();
//               },
//               builder: (BuildContext context, List<Object?> candidateData,
//                   List<dynamic> rejectedData) {
//                 return Stack(
//                   children: [
//                     Align(
//                       alignment: const Alignment(0, 1),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 2,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           border: Border.all(width: 2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Icon(Icons.delete, size: 50),
//                             const SizedBox(height: 5),
//                             Text("ドロップで削除", style: textStyleBold20),
//                             const SizedBox(height: 10),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             )