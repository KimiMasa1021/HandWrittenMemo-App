import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/providers/general_providers.dart';
import 'PaintComponent/color_picker.dart';
import 'draw_screen.dart';

class PaintScreen extends HookConsumerWidget {
  const PaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _paintController = ref.watch(drawControllerProvider.notifier);
    final _state = ref.read(drawControllerProvider);

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save_alt_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          DrawScreen(),
          SizedBox(
            width: double.infinity,
            height: 160,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: _paintController.clear,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.delete, size: 45),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: _paintController.undo,
                          child: const Icon(
                              Icons.settings_backup_restore_rounded,
                              size: 45),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            _paintController.chageEraser(Colors.white);
                          },
                          child: Container(
                            width: 40,
                            decoration: BoxDecoration(
                              color: _state.isEraser
                                  ? const Color.fromARGB(255, 133, 255, 139)
                                  : null,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.window, size: 45),
                          ),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: _paintController.clear,
                          child: Container(
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 133, 255, 139),
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
                  value: _state.thickness,
                  onChanged: (val) => _paintController.ticknessSlider(val),
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
          ),
        ],
      ),
    );
  }
}
