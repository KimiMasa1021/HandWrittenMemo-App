import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/common/shared/my_flutter_app_icons.dart';
import '../../../providers/general_providers.dart';
import 'paint_operate_icon.dart';

class PaintOperation extends HookConsumerWidget {
  PaintOperation({Key? key}) : super(key: key);
  void changeColor(Color color) {}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintController = ref.watch(drawControllerProvider.notifier);
    return SizedBox(
      width: double.infinity,
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            height: 3,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //　ひとつ戻る
                  PaintOperateIcon(
                    pickIcon: const Icon(
                      Icons.replay_outlined,
                      size: 45,
                    ),
                    function: () => paintController.undo(),
                  ),
                  //　ひとつ進む
                  PaintOperateIcon(
                    pickIcon: const Icon(
                      Icons.refresh,
                      size: 45,
                    ),
                    function: () => paintController.redo(),
                  ),
                ],
              ),
              const Spacer(),
              PaintOperateIcon(
                pickIcon: const Icon(
                  MyFlutterApp.eraser,
                  size: 45,
                ),
                function: () => paintController.chageEraser(Colors.white),
              ),
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
          Consumer(
            builder: (context, ref, child) {
              final paintController =
                  ref.watch(drawControllerProvider.notifier);
              final state = ref.watch(drawControllerProvider);
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.all(0),
                            contentPadding: const EdgeInsets.all(0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(500),
                                bottom: Radius.circular(100),
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: HueRingPicker(
                                pickerColor: state.pickColor,
                                onColorChanged: (color) =>
                                    paintController.chageColor(color),
                                enableAlpha: true,
                                displayThumbColor: true,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [
                            state.pickColor,
                            state.pickColor,
                            Colors.white,
                          ],
                          stops: const [0, 0.65, 0.5],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.color_lens_rounded,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      thumbColor: Colors.black,
                      activeColor: Colors.black,
                      inactiveColor: const Color.fromARGB(255, 210, 210, 210),
                      value: state.thickness,
                      onChanged: (val) => paintController.ticknessSlider(val),
                      min: 1,
                      max: 15,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
