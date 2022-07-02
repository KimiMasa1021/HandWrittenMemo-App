import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/providers/general_providers.dart';

import 'PaintComponent/paint_button.dart';
import 'draw_screen.dart';

class PaintScreen extends HookConsumerWidget {
  const PaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _paintController = ref.watch(drawControllerProvider.notifier);

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
              ))
        ],
      ),
      body: Column(
        children: [
          const DrawScreen(),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaintButton(
                      icon: const Icon(Icons.delete),
                      function: _paintController.clear,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PaintButton(
                          icon: const Icon(Icons.delete),
                          function: _paintController.clear,
                        ),
                        PaintButton(
                          icon: const Icon(Icons.delete),
                          function: _paintController.clear,
                        ),
                        PaintButton(
                          icon: const Icon(Icons.delete),
                          function: _paintController.clear,
                        ),
                      ],
                    ),
                  ],
                ),
                Slider(
                  value: 5,
                  onChanged: (val) {},
                  min: 0,
                  max: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
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
