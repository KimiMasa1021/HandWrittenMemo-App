import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Paint/painter.dart';

import '../../providers/general_providers.dart';

class DrawScreen extends HookConsumerWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _paintController = ref.watch(drawControllerProvider.notifier);
    final _state = ref.watch(drawControllerProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onPanStart: (details) {
              _paintController.addPaint(details.localPosition);
            },
            onPanUpdate: (details) {
              _paintController.updatePaint(details.localPosition);
            },
            onPanEnd: (details) {
              _paintController.endPaint();
            },
            child: CustomPaint(
              painter: Painter(
                state: _state,
                context: context,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
