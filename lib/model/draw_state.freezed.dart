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
  List<ColorPath> get pathLists => throw _privateConstructorUsedError;
  bool get isDrag => throw _privateConstructorUsedError;
  bool get isEraser => throw _privateConstructorUsedError;
  double get thickness => throw _privateConstructorUsedError;
  Color get pickColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawStateCopyWith<DrawState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawStateCopyWith<$Res> {
  factory $DrawStateCopyWith(DrawState value, $Res Function(DrawState) then) =
      _$DrawStateCopyWithImpl<$Res>;
  $Res call(
      {List<ColorPath> pathLists,
      bool isDrag,
      bool isEraser,
      double thickness,
      Color pickColor});
}

/// @nodoc
class _$DrawStateCopyWithImpl<$Res> implements $DrawStateCopyWith<$Res> {
  _$DrawStateCopyWithImpl(this._value, this._then);

  final DrawState _value;
  // ignore: unused_field
  final $Res Function(DrawState) _then;

  @override
  $Res call({
    Object? pathLists = freezed,
    Object? isDrag = freezed,
    Object? isEraser = freezed,
    Object? thickness = freezed,
    Object? pickColor = freezed,
  }) {
    return _then(_value.copyWith(
      pathLists: pathLists == freezed
          ? _value.pathLists
          : pathLists // ignore: cast_nullable_to_non_nullable
              as List<ColorPath>,
      isDrag: isDrag == freezed
          ? _value.isDrag
          : isDrag // ignore: cast_nullable_to_non_nullable
              as bool,
      isEraser: isEraser == freezed
          ? _value.isEraser
          : isEraser // ignore: cast_nullable_to_non_nullable
              as bool,
      thickness: thickness == freezed
          ? _value.thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as double,
      pickColor: pickColor == freezed
          ? _value.pickColor
          : pickColor // ignore: cast_nullable_to_non_nullable
              as Color,
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
      {List<ColorPath> pathLists,
      bool isDrag,
      bool isEraser,
      double thickness,
      Color pickColor});
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
    Object? pathLists = freezed,
    Object? isDrag = freezed,
    Object? isEraser = freezed,
    Object? thickness = freezed,
    Object? pickColor = freezed,
  }) {
    return _then(_$_DrawState(
      pathLists: pathLists == freezed
          ? _value._pathLists
          : pathLists // ignore: cast_nullable_to_non_nullable
              as List<ColorPath>,
      isDrag: isDrag == freezed
          ? _value.isDrag
          : isDrag // ignore: cast_nullable_to_non_nullable
              as bool,
      isEraser: isEraser == freezed
          ? _value.isEraser
          : isEraser // ignore: cast_nullable_to_non_nullable
              as bool,
      thickness: thickness == freezed
          ? _value.thickness
          : thickness // ignore: cast_nullable_to_non_nullable
              as double,
      pickColor: pickColor == freezed
          ? _value.pickColor
          : pickColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_DrawState implements _DrawState {
  const _$_DrawState(
      {final List<ColorPath> pathLists = const [],
      this.isDrag = false,
      this.isEraser = false,
      this.thickness = 6,
      this.pickColor = Colors.black})
      : _pathLists = pathLists;

  final List<ColorPath> _pathLists;
  @override
  @JsonKey()
  List<ColorPath> get pathLists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathLists);
  }

  @override
  @JsonKey()
  final bool isDrag;
  @override
  @JsonKey()
  final bool isEraser;
  @override
  @JsonKey()
  final double thickness;
  @override
  @JsonKey()
  final Color pickColor;

  @override
  String toString() {
    return 'DrawState(pathLists: $pathLists, isDrag: $isDrag, isEraser: $isEraser, thickness: $thickness, pickColor: $pickColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawState &&
            const DeepCollectionEquality()
                .equals(other._pathLists, _pathLists) &&
            const DeepCollectionEquality().equals(other.isDrag, isDrag) &&
            const DeepCollectionEquality().equals(other.isEraser, isEraser) &&
            const DeepCollectionEquality().equals(other.thickness, thickness) &&
            const DeepCollectionEquality().equals(other.pickColor, pickColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pathLists),
      const DeepCollectionEquality().hash(isDrag),
      const DeepCollectionEquality().hash(isEraser),
      const DeepCollectionEquality().hash(thickness),
      const DeepCollectionEquality().hash(pickColor));

  @JsonKey(ignore: true)
  @override
  _$$_DrawStateCopyWith<_$_DrawState> get copyWith =>
      __$$_DrawStateCopyWithImpl<_$_DrawState>(this, _$identity);
}

abstract class _DrawState implements DrawState {
  const factory _DrawState(
      {final List<ColorPath> pathLists,
      final bool isDrag,
      final bool isEraser,
      final double thickness,
      final Color pickColor}) = _$_DrawState;

  @override
  List<ColorPath> get pathLists => throw _privateConstructorUsedError;
  @override
  bool get isDrag => throw _privateConstructorUsedError;
  @override
  bool get isEraser => throw _privateConstructorUsedError;
  @override
  double get thickness => throw _privateConstructorUsedError;
  @override
  Color get pickColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DrawStateCopyWith<_$_DrawState> get copyWith =>
      throw _privateConstructorUsedError;
}
