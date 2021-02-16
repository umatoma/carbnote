// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthUserTearOff {
  const _$AuthUserTearOff();

// ignore: unused_element
  _AuthUser call(
      {@required String id,
      @nullable String email,
      @required bool isAnonymous}) {
    return _AuthUser(
      id: id,
      email: email,
      isAnonymous: isAnonymous,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthUser = _$AuthUserTearOff();

/// @nodoc
mixin _$AuthUser {
  String get id;
  @nullable
  String get email;
  bool get isAnonymous;

  @JsonKey(ignore: true)
  $AuthUserCopyWith<AuthUser> get copyWith;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res>;
  $Res call({String id, @nullable String email, bool isAnonymous});
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res> implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  final AuthUser _value;
  // ignore: unused_field
  final $Res Function(AuthUser) _then;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object isAnonymous = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) then) =
      __$AuthUserCopyWithImpl<$Res>;
  @override
  $Res call({String id, @nullable String email, bool isAnonymous});
}

/// @nodoc
class __$AuthUserCopyWithImpl<$Res> extends _$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(_AuthUser _value, $Res Function(_AuthUser) _then)
      : super(_value, (v) => _then(v as _AuthUser));

  @override
  _AuthUser get _value => super._value as _AuthUser;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object isAnonymous = freezed,
  }) {
    return _then(_AuthUser(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      isAnonymous:
          isAnonymous == freezed ? _value.isAnonymous : isAnonymous as bool,
    ));
  }
}

/// @nodoc
class _$_AuthUser implements _AuthUser {
  const _$_AuthUser(
      {@required this.id, @nullable this.email, @required this.isAnonymous})
      : assert(id != null),
        assert(isAnonymous != null);

  @override
  final String id;
  @override
  @nullable
  final String email;
  @override
  final bool isAnonymous;

  @override
  String toString() {
    return 'AuthUser(id: $id, email: $email, isAnonymous: $isAnonymous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.isAnonymous, isAnonymous) ||
                const DeepCollectionEquality()
                    .equals(other.isAnonymous, isAnonymous)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(isAnonymous);

  @JsonKey(ignore: true)
  @override
  _$AuthUserCopyWith<_AuthUser> get copyWith =>
      __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);
}

abstract class _AuthUser implements AuthUser {
  const factory _AuthUser(
      {@required String id,
      @nullable String email,
      @required bool isAnonymous}) = _$_AuthUser;

  @override
  String get id;
  @override
  @nullable
  String get email;
  @override
  bool get isAnonymous;
  @override
  @JsonKey(ignore: true)
  _$AuthUserCopyWith<_AuthUser> get copyWith;
}
