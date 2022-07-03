import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: paintController.clear,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.delete, size: 45),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: paintController.undo,
                    child: const Icon(Icons.settings_backup_restore_rounded,
                        size: 45),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      paintController.chageEraser(Colors.white);
                    },
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: state.isEraser
                            ? const Color.fromARGB(255, 133, 255, 139)
                            : null,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.window, size: 45),
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: paintController.penMode,
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: state.isEraser
                            ? null
                            : const Color.fromARGB(255, 133, 255, 139),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.brush, size: 45),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ],
          ),
          Slider(
            value: state.thickness,
            onChanged: (val) => paintController.ticknessSlider(val),
            min: 1,
            max: 10,
            divisions: 18,
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
          )
        ],
      ),
    );
  }
}
