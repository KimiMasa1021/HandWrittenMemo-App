import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Paint/painter.dart';

import '../../providers/general_providers.dart';

class DrawScreen extends HookConsumerWidget {
  DrawScreen({Key? key}) : super(key: key);
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _paintController = ref.watch(drawControllerProvider.notifier);
    final _state = ref.read(drawControllerProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          key: _key,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onPanStart: (details) {
              _paintController.addPaint(details.localPosition);
            },
            onPanUpdate: (details) {
              _paintController.updatePaint(_getPosition(
                  _key.currentContext!.size, details.localPosition));
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

  Offset _getPosition(Size? length, Offset localPosition) {
    double _dx;
    double _dy;
    if (localPosition.dx < 0) {
      _dx = 0;
    } else if (localPosition.dx > length!.width) {
      _dx = length.width;
    } else {
      _dx = localPosition.dx;
    }
    if (localPosition.dy < 0) {
      _dy = 0;
    } else if (localPosition.dy > length!.height) {
      _dy = length.height;
    } else {
      _dy = localPosition.dy;
    }
    return Offset(_dx, _dy);
  }
}
