import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/draw_move_state.dart';

class DrawMoveController extends StateNotifier<DrawMoveState> {
  DrawMoveController() : super(const DrawMoveState());

  void scaleStartCalculate(Offset details, Size size) {
    double x = ((details.dx - size.width / 2) / (size.width / 2));
    double y = ((details.dy - size.height / 2) / (size.height / 2));
    Offset initialForcalPoint = Offset(details.dx, details.dy);
    double initialScale = state.scale;

    state = state.copyWith(
      x: x,
      y: y,
      initialForcalPoint: initialForcalPoint,
      initialScale: initialScale,
    );
  }

  void scaleUpdateCalculate(ScaleEvent details) {
    double scale;
    Alignment align =
        Alignment((state.x + state.align.x) / 2, (state.y + state.align.y) / 2);

    if (state.initialScale * details.scale >= 15) {
      scale = 15;
    } else if (state.initialScale * details.scale <= 0.8) {
      scale = 0.8;
    } else {
      scale = state.initialScale * details.scale;
    }
    Offset sessionOffset =
        (details.focalPoint - state.initialForcalPoint) * state.scale;

    state = state.copyWith(
      align: align,
      scale: scale,
      sessionOffset: sessionOffset,
    );
  }

  void scaleEndCalculate() {
    Offset offset = state.offset + state.sessionOffset;

    state = state.copyWith(
      offset: offset,
      sessionOffset: Offset.zero,
    );
  }

  Offset getOffset() {
    return state.offset + state.sessionOffset;
  }
}
