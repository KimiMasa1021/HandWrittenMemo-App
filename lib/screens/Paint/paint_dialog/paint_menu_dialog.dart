import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../providers/general_providers.dart';
import 'dialog_parts/menu_tile.dart';
import 'paint_back_dialog.dart';
import 'paint_save_dialog.dart';

class PaintMenuDialog extends HookConsumerWidget {
  const PaintMenuDialog({Key? key, required this.imageKey}) : super(key: key);

  final GlobalKey imageKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawController = ref.watch(drawControllerProvider.notifier);
    final state = ref.watch(drawControllerProvider);

    final pictureRepository = ref.watch(pictureRepositoryProvider);

    return state.isOption2
        ? Positioned(
            bottom: 65.0,
            left: 5.0,
            width: MediaQuery.of(context).size.width / 1.8,
            height: 120.0,
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuTile(
                    icon: Icons.delete,
                    title: "すべて削除する",
                    function: drawController.clear,
                  ),
                  const Divider(
                    height: 3,
                    color: Colors.black,
                  ),
                  MenuTile(
                    icon: Icons.home,
                    title: "ホームに戻る",
                    function: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PaintBackDialog();
                        },
                      );
                    },
                  ),
                  const Divider(
                    height: 3,
                    color: Colors.black,
                  ),
                  MenuTile(
                    icon: Icons.save_as_outlined,
                    title: "保存する",
                    function: () {
                      pictureRepository.getDrawKey(imageKey);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PaintSaveDialog();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
