import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_path.dart';
part 'draw_move_state.freezed.dart';

@freezed
class DrawMoveState with _$DrawMoveState {
  const factory DrawMoveState({
    @Default(false) bool isDrag,
    @Default(Offset.zero) Offset offset,
    @Default(Offset.zero) Offset initialForcalPoint,
    @Default(Offset.zero) Offset sessionOffset,
    @Default(1.0) double scale,
    @Default(1.0) double initialScale,
    @Default(Alignment(0, 0)) Alignment align,
    DataPath? path,
    @Default(0) double x,
    @Default(0) double y,
  }) = _DrawMoveState;
}
