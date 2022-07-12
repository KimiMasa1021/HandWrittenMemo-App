import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    final size = MediaQuery.of(context).size;
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
      ),

      // body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: userPicture?.data?.isNotEmpty ?? false
            ? HomeGrid(userPicture: userPicture!)
            : const HomeNoData(),
      ),

      //floatingButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          drawControl.clear();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaintScreen()));
        },
        child: const Icon(Icons.photo_size_select_actual_rounded),
      ),
    );
  }
}
