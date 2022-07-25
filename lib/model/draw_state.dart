import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_path.dart';

part 'draw_state.freezed.dart';

@freezed
class DrawState with _$DrawState {
  const factory DrawState({
    @Default(false) bool isDrag,
    @Default(false) bool isEraser,
    @Default(false) bool isZoom,
    @Default(7.5) double thickness,
    DataPath? drawPath,
    @Default([]) List<DataPath> dataPath,
    @Default([]) List<DataPath> deletedPath,
    @Default(Offset.zero) Offset previousOffset,
    @Default(Colors.black) Color pickColor,
    @Default(Colors.black) Color previousColor,
  }) = _DrawState;
}
