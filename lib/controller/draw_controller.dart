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
        undoList: const [],
      );
    }
  }

  void updatePaint(Offset nextPoint) {
    if (state.isDrag) {
      final _paintList = List<List<Offset>>.of(state.paintList);
      final _offsetList = List<Offset>.of(state.paintList.last)..add(nextPoint);
      _paintList.last = _offsetList;

      state = state.copyWith(paintList: _paintList);
    }
  }

  void endPaint() {
    state = state.copyWith(isDrag: false);
  }

  void undo() {
    // ひとつ戻る
  }

  void redo() {
    // ひとつ進む
  }

  void clear() {
    if (!state.isDrag) {
      state = state.copyWith(paintList: [], undoList: []);
    }
  }
}
