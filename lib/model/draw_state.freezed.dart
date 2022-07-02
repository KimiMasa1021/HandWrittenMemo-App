// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'draw_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawState {
  List<List<Offset>> get paintList => throw _privateConstructorUsedError;
  List<List<Offset>> get undoList => throw _privateConstructorUsedError;
  bool get isDrag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawStateCopyWith<DrawState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawStateCopyWith<$Res> {
  factory $DrawStateCopyWith(DrawState value, $Res Function(DrawState) then) =
      _$DrawStateCopyWithImpl<$Res>;
  $Res call(
      {List<List<Offset>> paintList, List<List<Offset>> undoList, bool isDrag});
}

/// @nodoc
class _$DrawStateCopyWithImpl<$Res> implements $DrawStateCopyWith<$Res> {
  _$DrawStateCopyWithImpl(this._value, this._then);

  final DrawState _value;
  // ignore: unused_field
  final $Res Function(DrawState) _then;

  @override
  $Res call({
    Object? paintList = freezed,
    Object? undoList = freezed,
    Object? isDrag = freezed,
  }) {
    return _then(_value.copyWith(
      paintList: paintList == freezed
          ? _value.paintList
          : paintList // ignore: cast_nullable_to_non_nullable
              as List<List<Offset>>,
      undoList: undoList == freezed
          ? _value.undoList
          : undoList // ignore: cast_nullable_to_non_nullable
              as List<List<Offset>>,
      isDrag: isDrag == freezed
          ? _value.isDrag
          : isDrag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DrawStateCopyWith<$Res> implements $DrawStateCopyWith<$Res> {
  factory _$$_DrawStateCopyWith(
          _$_DrawState value, $Res Function(_$_DrawState) then) =
      __$$_DrawStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<List<Offset>> paintList, List<List<Offset>> undoList, bool isDrag});
}

/// @nodoc
class __$$_DrawStateCopyWithImpl<$Res> extends _$DrawStateCopyWithImpl<$Res>
    implements _$$_DrawStateCopyWith<$Res> {
  __$$_DrawStateCopyWithImpl(
      _$_DrawState _value, $Res Function(_$_DrawState) _then)
      : super(_value, (v) => _then(v as _$_DrawState));

  @override
  _$_DrawState get _value => super._value as _$_DrawState;

  @override
  $Res call({
    Object? paintList = freezed,
    Object? undoList = freezed,
    Object? isDrag = freezed,
  }) {
    return _then(_$_DrawState(
      paintList: paintList == freezed
          ? _value._paintList
          : paintList // ignore: cast_nullable_to_non_nullable
              as List<List<Offset>>,
      undoList: undoList == freezed
          ? _value._undoList
          : undoList // ignore: cast_nullable_to_non_nullable
              as List<List<Offset>>,
      isDrag: isDrag == freezed
          ? _value.isDrag
          : isDrag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DrawState implements _DrawState {
  const _$_DrawState(
      {final List<List<Offset>> paintList = const <List<Offset>>[],
      final List<List<Offset>> undoList = const <List<Offset>>[],
      this.isDrag = false})
      : _paintList = paintList,
        _undoList = undoList;

  final List<List<Offset>> _paintList;
  @override
  @JsonKey()
  List<List<Offset>> get paintList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paintList);
  }

  final List<List<Offset>> _undoList;
  @override
  @JsonKey()
  List<List<Offset>> get undoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_undoList);
  }

  @override
  @JsonKey()
  final bool isDrag;

  @override
  String toString() {
    return 'DrawState(paintList: $paintList, undoList: $undoList, isDrag: $isDrag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawState &&
            const DeepCollectionEquality()
                .equals(other._paintList, _paintList) &&
            const DeepCollectionEquality().equals(other._undoList, _undoList) &&
            const DeepCollectionEquality().equals(other.isDrag, isDrag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_paintList),
      const DeepCollectionEquality().hash(_undoList),
      const DeepCollectionEquality().hash(isDrag));

  @JsonKey(ignore: true)
  @override
  _$$_DrawStateCopyWith<_$_DrawState> get copyWith =>
      __$$_DrawStateCopyWithImpl<_$_DrawState>(this, _$identity);
}

abstract class _DrawState implements DrawState {
  const factory _DrawState(
      {final List<List<Offset>> paintList,
      final List<List<Offset>> undoList,
      final bool isDrag}) = _$_DrawState;

  @override
  List<List<Offset>> get paintList => throw _privateConstructorUsedError;
  @override
  List<List<Offset>> get undoList => throw _privateConstructorUsedError;
  @override
  bool get isDrag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DrawStateCopyWith<_$_DrawState> get copyWith =>
      throw _privateConstructorUsedError;
}
