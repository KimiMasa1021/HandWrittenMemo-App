import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zen03/model/color_path.dart';

part 'draw_state.freezed.dart';

@freezed
class DrawState with _$DrawState {
  const factory DrawState({
    @Default([]) List<ColorPath> pathLists,
    @Default(false) bool isDrag,
    @Default(false) bool isEraser,
    @Default(6) double thickness,
    @Default(Colors.black) Color pickColor,
  }) = _DrawState;
}
