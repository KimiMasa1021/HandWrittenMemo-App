import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'paint_setup_state.freezed.dart';

@freezed
class PaintSetUpState with _$PaintSetUpState {
  factory PaintSetUpState({
    File? image,
    @Default("") String type,
  }) = _PaintSetUpState;
}
