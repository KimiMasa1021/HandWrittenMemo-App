import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_state.freezed.dart';

@freezed
abstract class DrawState with _$DrawState {
  const factory DrawState({
    @Default(<List<Offset>>[]) List<List<Offset>> paintList,
    @Default(<List<Offset>>[]) List<List<Offset>> undoList,
    @Default(false) bool isDrag,
  }) = _DrawState;
}
