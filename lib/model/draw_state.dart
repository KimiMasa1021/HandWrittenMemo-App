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
    @Default(Colors.black) Color previousColor,
    @Default(Offset.zero) Offset offset,
    @Default(Offset.zero) Offset initialFocalPoint,
    @Default(Offset.zero) Offset sessionOffset,
    @Default(1.0) double scale,
    @Default(1.0) double initialScale,
  }) = _DrawState;
}
