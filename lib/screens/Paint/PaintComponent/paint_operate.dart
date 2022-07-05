import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Paint/PaintComponent/paint_operate_icon.dart';
import 'package:zen03/screens/paint/PaintComponent/color_picker.dart';
import '../../../providers/general_providers.dart';

class PaintOperation extends StatelessWidget {
  const PaintOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  すべて削除
              const PaintOperateIcon(
                pickIcon: Icon(
                  Icons.delete,
                  size: 45,
                ),
                funcFlg: 'delete',
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  //  ひとつ戻る
                  PaintOperateIcon(
                    pickIcon: Icon(
                      Icons.settings_backup_restore_rounded,
                      size: 45,
                    ),
                    funcFlg: 'undo',
                  ),
                  //  消しゴム
                  PaintOperateIcon(
                    pickIcon: Icon(
                      Icons.window_rounded,
                      size: 45,
                    ),
                    funcFlg: 'eraser',
                  ),
                  SizedBox(width: 15),
                  //  ペンモード
                  PaintOperateIcon(
                    pickIcon: Icon(
                      Icons.brush,
                      size: 45,
                    ),
                    funcFlg: 'pen',
                  ),
                  SizedBox(width: 15),
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
                max: 10,
                divisions: 18,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ColorPicker(pickColor: Colors.red),
              ColorPicker(pickColor: Colors.blue),
              ColorPicker(pickColor: Colors.yellow),
              ColorPicker(pickColor: Colors.green),
              ColorPicker(pickColor: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
