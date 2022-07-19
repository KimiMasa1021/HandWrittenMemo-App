import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/common/shared/my_flutter_app_icons.dart';
import 'package:zen03/screens/Paint/PaintComponent/paint_operate_icon.dart';
import 'package:zen03/screens/paint/PaintComponent/color_picker.dart';
import '../../../providers/general_providers.dart';

class PaintOperation extends HookConsumerWidget {
  const PaintOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintController = ref.watch(drawControllerProvider.notifier);
    final state = ref.watch(drawControllerProvider);
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  すべて削除
              PaintOperateIcon(
                pickIcon: const Icon(
                  Icons.delete,
                  size: 45,
                ),
                function: () => paintController.clear(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //  ひとつ戻る
                  PaintOperateIcon(
                    pickIcon: const Icon(
                      Icons.settings_backup_restore_rounded,
                      size: 45,
                    ),
                    function: () => paintController.undo(),
                  ),
                  //  拡大　縮小
                  PaintOperateIcon(
                    pickIcon: const Icon(
                      Icons.front_hand_outlined,
                      size: 45,
                    ),
                    function: () => paintController.zoomMode(),
                  ),
                  //  消しゴム
                  PaintOperateIcon(
                    pickIcon: const Icon(
                      MyFlutterApp.eraser,
                      size: 45,
                    ),
                    function: () => paintController.chageEraser(Colors.white),
                  ),
                  const SizedBox(width: 15),
                  //  ペンモード
                  PaintOperateIcon(
                    pickIcon: const Icon(
                      Icons.brush,
                      size: 45,
                    ),
                    function: () => paintController.penMode(),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              final paintController =
                  ref.watch(drawControllerProvider.notifier);
              final state = ref.watch(drawControllerProvider);
              return Slider(
                value: state.thickness,
                onChanged: (val) => paintController.ticknessSlider(val),
                min: 1,
                max: 15,
              );
            },
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     ColorPicker(pickColor: Colors.red),
          //     ColorPicker(pickColor: Colors.blue),
          //     ColorPicker(pickColor: Colors.yellow),
          //     ColorPicker(pickColor: Colors.green),
          //     ColorPicker(pickColor: Colors.black),
          //   ],
          // ),
        ],
      ),
    );
  }
}
