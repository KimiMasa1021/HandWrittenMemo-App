// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'picture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PictureState {
  String? get userId => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  DateTime? get createAt => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureStateCopyWith<PictureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureStateCopyWith<$Res> {
  factory $PictureStateCopyWith(
          PictureState value, $Res Function(PictureState) then) =
      _$PictureStateCopyWithImpl<$Res>;
  $Res call(
      {String? userId,
      String? uid,
      DateTime? createAt,
      String? title,
      String? thumbnailUrl});
}

/// @nodoc
class _$PictureStateCopyWithImpl<$Res> implements $PictureStateCopyWith<$Res> {
  _$PictureStateCopyWithImpl(this._value, this._then);

  final PictureState _value;
  // ignore: unused_field
  final $Res Function(PictureState) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? uid = freezed,
    Object? createAt = freezed,
    Object? title = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PictureStateCopyWith<$Res>
    implements $PictureStateCopyWith<$Res> {
  factory _$$_PictureStateCopyWith(
          _$_PictureState value, $Res Function(_$_PictureState) then) =
      __$$_PictureStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userId,
      String? uid,
      DateTime? createAt,
      String? title,
      String? thumbnailUrl});
}

/// @nodoc
class __$$_PictureStateCopyWithImpl<$Res>
    extends _$PictureStateCopyWithImpl<$Res>
    implements _$$_PictureStateCopyWith<$Res> {
  __$$_PictureStateCopyWithImpl(
      _$_PictureState _value, $Res Function(_$_PictureState) _then)
      : super(_value, (v) => _then(v as _$_PictureState));

  @override
  _$_PictureState get _value => super._value as _$_PictureState;

  @override
  $Res call({
    Object? userId = freezed,
    Object? uid = freezed,
    Object? createAt = freezed,
    Object? title = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_$_PictureState(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PictureState implements _PictureState {
  const _$_PictureState(
      {this.userId, this.uid, this.createAt, this.title, this.thumbnailUrl});

  @override
  final String? userId;
  @override
  final String? uid;
  @override
  final DateTime? createAt;
  @override
  final String? title;
  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'PictureState(userId: $userId, uid: $uid, createAt: $createAt, title: $title, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PictureState &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailUrl, thumbnailUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(thumbnailUrl));

  @JsonKey(ignore: true)
  @override
  _$$_PictureStateCopyWith<_$_PictureState> get copyWith =>
      __$$_PictureStateCopyWithImpl<_$_PictureState>(this, _$identity);
}

abstract class _PictureState implements PictureState {
  const factory _PictureState(
      {final String? userId,
      final String? uid,
      final DateTime? createAt,
      final String? title,
      final String? thumbnailUrl}) = _$_PictureState;

  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get uid => throw _privateConstructorUsedError;
  @override
  DateTime? get createAt => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PictureStateCopyWith<_$_PictureState> get copyWith =>
      throw _privateConstructorUsedError;
}
