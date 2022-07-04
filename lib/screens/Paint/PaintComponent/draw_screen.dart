import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Paint/painter.dart';

import '../../../providers/general_providers.dart';

class DrawScreen extends StatelessWidget {
  DrawScreen({Key? key}) : super(key: key);
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
          child: Consumer(
            builder: (context, ref, child) {
              final paintController =
                  ref.watch(drawControllerProvider.notifier);
              final state = ref.watch(drawControllerProvider);
              return GestureDetector(
                onPanStart: (details) {
                  paintController.addPaint(details.localPosition);
                },
                onPanUpdate: (details) {
                  paintController.updatePaint(_getPosition(
                      _key.currentContext!.size, details.localPosition));
                },
                onPanEnd: (details) {
                  paintController.endPaint();
                },
                child: CustomPaint(
                  painter: Painter(
                    state: state,
                    context: context,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Offset _getPosition(Size? length, Offset localPosition) {
    double dx;
    double dy;
    if (localPosition.dx < 0) {
      dx = 0;
    } else if (localPosition.dx > length!.width) {
      dx = length.width;
    } else {
      dx = localPosition.dx;
    }
    if (localPosition.dy < 0) {
      dy = 0;
    } else if (localPosition.dy > length!.height) {
      dy = length.height;
    } else {
      dy = localPosition.dy;
    }
    return Offset(dx, dy);
  }
}
