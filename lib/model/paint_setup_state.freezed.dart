// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paint_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaintSetUpState {
  File? get image => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaintSetUpStateCopyWith<PaintSetUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaintSetUpStateCopyWith<$Res> {
  factory $PaintSetUpStateCopyWith(
          PaintSetUpState value, $Res Function(PaintSetUpState) then) =
      _$PaintSetUpStateCopyWithImpl<$Res>;
  $Res call({File? image, String type});
}

/// @nodoc
class _$PaintSetUpStateCopyWithImpl<$Res>
    implements $PaintSetUpStateCopyWith<$Res> {
  _$PaintSetUpStateCopyWithImpl(this._value, this._then);

  final PaintSetUpState _value;
  // ignore: unused_field
  final $Res Function(PaintSetUpState) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PaintSetUpStateCopyWith<$Res>
    implements $PaintSetUpStateCopyWith<$Res> {
  factory _$$_PaintSetUpStateCopyWith(
          _$_PaintSetUpState value, $Res Function(_$_PaintSetUpState) then) =
      __$$_PaintSetUpStateCopyWithImpl<$Res>;
  @override
  $Res call({File? image, String type});
}

/// @nodoc
class __$$_PaintSetUpStateCopyWithImpl<$Res>
    extends _$PaintSetUpStateCopyWithImpl<$Res>
    implements _$$_PaintSetUpStateCopyWith<$Res> {
  __$$_PaintSetUpStateCopyWithImpl(
      _$_PaintSetUpState _value, $Res Function(_$_PaintSetUpState) _then)
      : super(_value, (v) => _then(v as _$_PaintSetUpState));

  @override
  _$_PaintSetUpState get _value => super._value as _$_PaintSetUpState;

  @override
  $Res call({
    Object? image = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_PaintSetUpState(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PaintSetUpState implements _PaintSetUpState {
  _$_PaintSetUpState({this.image, this.type = ""});

  @override
  final File? image;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'PaintSetUpState(image: $image, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaintSetUpState &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_PaintSetUpStateCopyWith<_$_PaintSetUpState> get copyWith =>
      __$$_PaintSetUpStateCopyWithImpl<_$_PaintSetUpState>(this, _$identity);
}

abstract class _PaintSetUpState implements PaintSetUpState {
  factory _PaintSetUpState({final File? image, final String type}) =
      _$_PaintSetUpState;

  @override
  File? get image;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_PaintSetUpStateCopyWith<_$_PaintSetUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
