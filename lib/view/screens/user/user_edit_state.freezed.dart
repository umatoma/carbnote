// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserEditStateTearOff {
  const _$UserEditStateTearOff();

// ignore: unused_element
  _UserEditState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required User user,
      @nullable File imageFile}) {
    return _UserEditState(
      isProcessing: isProcessing,
      error: error,
      user: user,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserEditState = _$UserEditStateTearOff();

/// @nodoc
mixin _$UserEditState {
  bool get isProcessing;
  @nullable
  Object get error;
  User get user;
  @nullable
  File get imageFile;

  @JsonKey(ignore: true)
  $UserEditStateCopyWith<UserEditState> get copyWith;
}

/// @nodoc
abstract class $UserEditStateCopyWith<$Res> {
  factory $UserEditStateCopyWith(
          UserEditState value, $Res Function(UserEditState) then) =
      _$UserEditStateCopyWithImpl<$Res>;
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      User user,
      @nullable File imageFile});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserEditStateCopyWithImpl<$Res>
    implements $UserEditStateCopyWith<$Res> {
  _$UserEditStateCopyWithImpl(this._value, this._then);

  final UserEditState _value;
  // ignore: unused_field
  final $Res Function(UserEditState) _then;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object user = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed ? _value.user : user as User,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UserEditStateCopyWith<$Res>
    implements $UserEditStateCopyWith<$Res> {
  factory _$UserEditStateCopyWith(
          _UserEditState value, $Res Function(_UserEditState) then) =
      __$UserEditStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      User user,
      @nullable File imageFile});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$UserEditStateCopyWithImpl<$Res>
    extends _$UserEditStateCopyWithImpl<$Res>
    implements _$UserEditStateCopyWith<$Res> {
  __$UserEditStateCopyWithImpl(
      _UserEditState _value, $Res Function(_UserEditState) _then)
      : super(_value, (v) => _then(v as _UserEditState));

  @override
  _UserEditState get _value => super._value as _UserEditState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object user = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_UserEditState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed ? _value.user : user as User,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
    ));
  }
}

/// @nodoc
class _$_UserEditState implements _UserEditState {
  _$_UserEditState(
      {@required this.isProcessing,
      @nullable this.error,
      @required this.user,
      @nullable this.imageFile})
      : assert(isProcessing != null),
        assert(user != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final User user;
  @override
  @nullable
  final File imageFile;

  @override
  String toString() {
    return 'UserEditState(isProcessing: $isProcessing, error: $error, user: $user, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEditState &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(imageFile);

  @JsonKey(ignore: true)
  @override
  _$UserEditStateCopyWith<_UserEditState> get copyWith =>
      __$UserEditStateCopyWithImpl<_UserEditState>(this, _$identity);
}

abstract class _UserEditState implements UserEditState {
  factory _UserEditState(
      {@required bool isProcessing,
      @nullable Object error,
      @required User user,
      @nullable File imageFile}) = _$_UserEditState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  User get user;
  @override
  @nullable
  File get imageFile;
  @override
  @JsonKey(ignore: true)
  _$UserEditStateCopyWith<_UserEditState> get copyWith;
}
