import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/color_path.dart';
import 'package:zen03/model/draw_state.dart';

class DrawController extends StateNotifier<DrawState> {
  DrawController() : super(const DrawState());

  void addPaint(ColorPath colorPath) {
    state = state.copyWith(
      isDrag: true,
      pathLists: List.of(state.pathLists)..add(colorPath),
    );
  }

  void undo() {
    if (state.pathLists.isEmpty) {
      return;
    }
    state = state.copyWith(
      pathLists: List.of(state.pathLists)..removeLast(),
    );
  }

  void clear() {
    state = state.copyWith(
      pathLists: [],
    );
  }

  void ticknessSlider(double val) {
    state = state.copyWith(thickness: val);
  }

  void chageColor(Color pick) {
    state = state.copyWith(pickColor: pick, isEraser: false);
  }

  void chageEraser(Color pick) {
    //　消しゴム機能　オン！！！！
    if (state.isEraser) {
      state = state.copyWith(
        pickColor: Colors.black,
        isEraser: false,
      );
    } else {
      state = state.copyWith(
        pickColor: pick,
        isEraser: true,
      );
    }
  }

  void penMode() {
    state = state.copyWith(isEraser: false, pickColor: Colors.black);
  }
}
