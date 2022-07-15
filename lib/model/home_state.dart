import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(3) int gridRow,
    @Default(false) bool isDrag,
    @Default(100) double feedBackCardWidth,
    @Default(false) bool isTarget,
  }) = _HomeState;
}
