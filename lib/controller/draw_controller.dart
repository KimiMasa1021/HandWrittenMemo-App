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
        ));
  }

  void undo() {
    if (state.dataPath.isEmpty) {
      return;
    }
    state = state.copyWith(
      dataPath: List.of(state.dataPath)..removeLast(),
    );
  }

  void clear() {
    if (!state.isDrag) {
      state = state.copyWith(
        dataPath: [],
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
      previousColor: pick,
      isEraser: false,
    );
  }

  void chageEraser(Color pick) {
    if (state.isEraser) {
      state = state.copyWith(
        pickColor: state.previousColor,
        isEraser: false,
      );
    } else {
      state = state.copyWith(
        previousColor: state.pickColor,
        pickColor: pick,
        isEraser: true,
        isZoom: false,
      );
    }
  }

  void penMode() {
    state = state.copyWith(
      isEraser: false,
      pickColor: state.previousColor,
      isZoom: false,
    );
  }

  void saveColor() {
    state = state.copyWith(
      previousColor: state.pickColor,
    );
  }

  ///////////////////////
  ///拡大縮小をするときの処理
  void zoomMode() {
    state = state.copyWith(
      isZoom: true,
      isEraser: false,
    );
  }
}
