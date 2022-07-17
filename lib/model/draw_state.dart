import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_state.freezed.dart';

@freezed
class DrawState with _$DrawState {
  const factory DrawState({
    @Default(<List<Offset>>[]) List<List<Offset>> paintList,
    @Default([]) List<double> thicknessList,
    @Default([]) List<Color> colorList,
    @Default(false) bool isDrag,
    @Default(false) bool isEraser,
    @Default(false) bool isZoom,
    @Default(7.5) double thickness,
    @Default(Colors.black) Color pickColor,
    @Default(1) double scaleValue,
    @Default(Offset(0, 0)) Offset offsetValue,
  }) = _DrawState;
}
