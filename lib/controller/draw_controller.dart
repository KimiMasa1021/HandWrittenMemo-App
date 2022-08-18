import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/draw_state.dart';

import '../model/data_path.dart';

class DrawController extends StateNotifier<DrawState> {
  DrawController() : super(const DrawState());

  ///////////////////////
  ///線を描く時の処理
  void startPath(Offset offset, DataPath? path) {
    path!.path.moveTo(offset.dx, offset.dy);
    state = state.copyWith(
      previousOffset: offset,
      isDrag: true,
      drawPath: path,
      isOption: false,
      isOption2: false,
    );
  }

  void updatePath(Offset offset, DataPath? path) {
    double midX = (state.previousOffset.dx + offset.dx) / 2;
    double midY = (state.previousOffset.dy + offset.dy) / 2;
    path!.path.quadraticBezierTo(
      state.previousOffset.dx,
      state.previousOffset.dy,
      midX,
      midY,
    );
    state = state.copyWith(
      previousOffset: offset,
      drawPath: path,
    );
  }

  void savePath(DataPath path) {
    state = state.copyWith(
      isDrag: false,
      dataPath: List.of(state.dataPath)..add(path),
      drawPath: DataPath(
        color: state.pickColor,
        thickness: state.thickness,
      ),
    );
  }

  void firstPoint(Offset offset, DataPath? path) {
    path!.firstPoint = offset;
  }

  void undo() {
    if (state.dataPath.isEmpty) {
      return;
    }
    state = state.copyWith(
      deletedPath: List.of(state.deletedPath)..add(state.dataPath.last),
      dataPath: List.of(state.dataPath)..removeLast(),
    );
  }

  void redo() {
    if (state.deletedPath.isEmpty) {
      return;
    }
    state = state.copyWith(
      dataPath: List.of(state.dataPath)..add(state.deletedPath.last),
      deletedPath: List.of(state.deletedPath)..removeLast(),
    );
  }

  void clear() {
    if (!state.isDrag) {
      state = state.copyWith(
        dataPath: [],
        pickColor: Colors.black,
        deletedPath: [],
        isOption2: false,
      );
    }
  }

  void ticknessSlider(double val) {
    if (!state.isDrag) {
      state = state.copyWith(thickness: val);
    }
  }

  void chageColor(Color pick) {
    state = state.copyWith(
      pickColor: pick,
      isEraser: false,
      isOption: false,
      isOption2: false,
    );
  }

  void changePen() {
    if (state.isEraser) {
      state = state.copyWith(
        isEraser: false,
        pickColor: state.previousColor,
        isOption: false,
        isOption2: false,
      );
    } else {
      state = state.copyWith(
        isEraser: true,
        previousColor: state.pickColor,
        pickColor: Colors.white,
        isOption: false,
        isOption2: false,
      );
    }
  }

  void showOption() {
    state = state.copyWith(
      isOption2: state.isOption2 ? false : false,
      isOption: !state.isOption,
    );
  }

  void showOption2() {
    state = state.copyWith(
      isOption: state.isOption ? false : false,
      isOption2: !state.isOption2,
    );
  }

  Offset getPosition(Size? length, Offset offset) {
    double dx;
    double dy;
    double setd = 2;
    if (offset.dx < 0) {
      dx = 0;
    } else if (offset.dx > (length!.width - setd)) {
      dx = length.width - setd;
    } else {
      dx = offset.dx;
    }
    if (offset.dy < 0) {
      dy = 0;
    } else if (offset.dy > (length!.height - setd)) {
      dy = length.height - setd;
    } else {
      dy = offset.dy;
    }
    return Offset(dx, dy);
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("廃棄");
  }
}
