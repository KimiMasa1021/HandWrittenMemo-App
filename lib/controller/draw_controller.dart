import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/draw_state.dart';

class DrawController extends StateNotifier<DrawState> {
  DrawController() : super(const DrawState());
  void addPaint(Offset startPoint) {
    if (!state.isDrag) {
      state = state.copyWith(
        isDrag: true,
        paintList: List.of(state.paintList)..add([startPoint]),
        thicknessList: List.of(state.thicknessList)..add(state.thickness),
        colorList: List.of(state.colorList)..add(state.pickColor),
      );
    }
  }

  void updatePaint(Offset nextPoint) {
    if (state.isDrag) {
      final paintList = List<List<Offset>>.of(state.paintList);
      final offsetList = List<Offset>.of(state.paintList.last)..add(nextPoint);
      paintList.last = offsetList;

      state = state.copyWith(paintList: paintList);
    }
  }

  void endPaint() {
    state = state.copyWith(isDrag: false);
  }

  void undo() {
    if (state.paintList.isEmpty) {
      return;
    }
    state = state.copyWith(
      paintList: List.of(state.paintList)..removeLast(),
      thicknessList: List.of(state.thicknessList)..removeLast(),
      colorList: List.of(state.colorList)..removeLast(),
    );
  }

  void clear() {
    if (!state.isDrag) {
      state = state.copyWith(
        paintList: [],
        thicknessList: [],
        colorList: [],
      );
    }
  }

  void ticknessSlider(double val) {
    if (!state.isDrag) {
      state = state.copyWith(thickness: val);
    }
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
