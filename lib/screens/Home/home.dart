import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../controller/picture_controller.dart';
import '../../model/picture_model.dart';
import '../../providers/general_providers.dart';
import '../paint/paint_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPicture = ref.watch(pictureControllerProvider);
    final drawControl = ref.watch(drawControllerProvider.notifier);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "手書きメモ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          drawControl.clear();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaintScreen()));
        },
        child: const Icon(Icons.photo_size_select_actual_rounded),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: userPicture?.data?.isNotEmpty ?? false
              ? GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.74,
                  children: List.generate(
                    userPicture?.data?.length ?? 0,
                    (index) {
                      Picture? picture = userPicture?.data?[index];
                      return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Image(
                              image: NetworkImage(picture!.thumbnailUrl!)));
                    },
                  ),
                )
              : const Text("でーたなし"),
        ),
      ),
    );
  }
}
