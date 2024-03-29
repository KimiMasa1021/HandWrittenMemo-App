import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/common/shared/my_flutter_app_icons.dart';
import '../../../../providers/general_providers.dart';
import 'paint_operate_icon.dart';

class PaintOperation extends HookConsumerWidget {
  const PaintOperation({Key? key}) : super(key: key);
  void changeColor(Color color) {}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintController = ref.watch(drawControllerProvider.notifier);
    final state = ref.watch(drawControllerProvider);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all()),
          width: double.infinity,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PaintOperateIcon(
                        pickIcon: Icon(
                          !state.isOption2 ? Icons.menu : Icons.close,
                          size: 45,
                        ),
                        function: () => paintController.showOption2(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      state.isEraser
                          ? InkWell(
                              onTap: () {
                                paintController.showOption();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Icon(
                                  MyFlutterApp.eraser_1,
                                  size: 40,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                paintController.showOption();
                              },
                              child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Image(
                                      width: 40,
                                      image: AssetImage("assets/pen.png"))),
                            ),
                      PaintOperateIcon(
                        pickIcon: const Icon(
                          MyFlutterApp.changepen,
                          size: 45,
                        ),
                        function: () => paintController.changePen(),
                      ),
                      const SizedBox(width: 5),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: const Alignment(0, -1),
          child: InkWell(
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
                        colorPickerHeight: 300,
                        enableAlpha: true,
                        displayThumbColor: false,
                        hueRingStrokeWidth: 40,
                        pickerColor: state.pickColor,
                        onColorChanged: (color) =>
                            paintController.chageColor(color),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: state.pickColor,
                shape: BoxShape.circle,
                border: Border.all(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
