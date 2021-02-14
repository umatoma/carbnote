// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SignInStateTearOff {
  const _$SignInStateTearOff();

// ignore: unused_element
  _SignInState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required String email,
      @required String password}) {
    return _SignInState(
      isProcessing: isProcessing,
      error: error,
      email: email,
      password: password,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignInState = _$SignInStateTearOff();

/// @nodoc
mixin _$SignInState {
  bool get isProcessing;
  @nullable
  Object get error;
  String get email;
  String get password;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      String email,
      String password});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
abstract class _$SignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(
          _SignInState value, $Res Function(_SignInState) then) =
      __$SignInStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      String email,
      String password});
}

/// @nodoc
class __$SignInStateCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(
      _SignInState _value, $Res Function(_SignInState) _then)
      : super(_value, (v) => _then(v as _SignInState));

  @override
  _SignInState get _value => super._value as _SignInState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_SignInState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$_SignInState implements _SignInState {
  _$_SignInState(
      {@required this.isProcessing,
      @nullable this.error,
      @required this.email,
      @required this.password})
      : assert(isProcessing != null),
        assert(email != null),
        assert(password != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final String email;
  @override
  final String password;

  bool _didcanSignIn = false;
  bool _canSignIn;

  @override
  bool get canSignIn {
    if (_didcanSignIn == false) {
      _didcanSignIn = true;
      _canSignIn = email.isNotEmpty && password.isNotEmpty;
    }
    return _canSignIn;
  }

  bool _didcanResetPassword = false;
  bool _canResetPassword;

  @override
  bool get canResetPassword {
    if (_didcanResetPassword == false) {
      _didcanResetPassword = true;
      _canResetPassword = email.isNotEmpty;
    }
    return _canResetPassword;
  }

  @override
  String toString() {
    return 'SignInState(isProcessing: $isProcessing, error: $error, email: $email, password: $password, canSignIn: $canSignIn, canResetPassword: $canResetPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInState &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$SignInStateCopyWith<_SignInState> get copyWith =>
      __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  factory _SignInState(
      {@required bool isProcessing,
      @nullable Object error,
      @required String email,
      @required String password}) = _$_SignInState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignInStateCopyWith<_SignInState> get copyWith;
}
