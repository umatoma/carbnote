// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_user_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthUserEditFormTearOff {
  const _$AuthUserEditFormTearOff();

// ignore: unused_element
  _AuthUserEditForm call({@required String email, @required String password}) {
    return _AuthUserEditForm(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthUserEditForm = _$AuthUserEditFormTearOff();

/// @nodoc
mixin _$AuthUserEditForm {
  String get email;
  String get password;

  @JsonKey(ignore: true)
  $AuthUserEditFormCopyWith<AuthUserEditForm> get copyWith;
}

/// @nodoc
abstract class $AuthUserEditFormCopyWith<$Res> {
  factory $AuthUserEditFormCopyWith(
          AuthUserEditForm value, $Res Function(AuthUserEditForm) then) =
      _$AuthUserEditFormCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$AuthUserEditFormCopyWithImpl<$Res>
    implements $AuthUserEditFormCopyWith<$Res> {
  _$AuthUserEditFormCopyWithImpl(this._value, this._then);

  final AuthUserEditForm _value;
  // ignore: unused_field
  final $Res Function(AuthUserEditForm) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthUserEditFormCopyWith<$Res>
    implements $AuthUserEditFormCopyWith<$Res> {
  factory _$AuthUserEditFormCopyWith(
          _AuthUserEditForm value, $Res Function(_AuthUserEditForm) then) =
      __$AuthUserEditFormCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$AuthUserEditFormCopyWithImpl<$Res>
    extends _$AuthUserEditFormCopyWithImpl<$Res>
    implements _$AuthUserEditFormCopyWith<$Res> {
  __$AuthUserEditFormCopyWithImpl(
      _AuthUserEditForm _value, $Res Function(_AuthUserEditForm) _then)
      : super(_value, (v) => _then(v as _AuthUserEditForm));

  @override
  _AuthUserEditForm get _value => super._value as _AuthUserEditForm;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_AuthUserEditForm(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$_AuthUserEditForm implements _AuthUserEditForm {
  _$_AuthUserEditForm({@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthUserEditForm(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthUserEditForm &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$AuthUserEditFormCopyWith<_AuthUserEditForm> get copyWith =>
      __$AuthUserEditFormCopyWithImpl<_AuthUserEditForm>(this, _$identity);
}

abstract class _AuthUserEditForm implements AuthUserEditForm {
  factory _AuthUserEditForm(
      {@required String email,
      @required String password}) = _$_AuthUserEditForm;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$AuthUserEditFormCopyWith<_AuthUserEditForm> get copyWith;
}

/// @nodoc
class _$AuthUserEditStateTearOff {
  const _$AuthUserEditStateTearOff();

// ignore: unused_element
  _AuthUserEditState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required AuthUserEditForm form,
      @required AuthUser authUser}) {
    return _AuthUserEditState(
      isProcessing: isProcessing,
      error: error,
      form: form,
      authUser: authUser,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthUserEditState = _$AuthUserEditStateTearOff();

/// @nodoc
mixin _$AuthUserEditState {
  bool get isProcessing;
  @nullable
  Object get error;
  AuthUserEditForm get form;
  AuthUser get authUser;

  @JsonKey(ignore: true)
  $AuthUserEditStateCopyWith<AuthUserEditState> get copyWith;
}

/// @nodoc
abstract class $AuthUserEditStateCopyWith<$Res> {
  factory $AuthUserEditStateCopyWith(
          AuthUserEditState value, $Res Function(AuthUserEditState) then) =
      _$AuthUserEditStateCopyWithImpl<$Res>;
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      AuthUserEditForm form,
      AuthUser authUser});

  $AuthUserEditFormCopyWith<$Res> get form;
  $AuthUserCopyWith<$Res> get authUser;
}

/// @nodoc
class _$AuthUserEditStateCopyWithImpl<$Res>
    implements $AuthUserEditStateCopyWith<$Res> {
  _$AuthUserEditStateCopyWithImpl(this._value, this._then);

  final AuthUserEditState _value;
  // ignore: unused_field
  final $Res Function(AuthUserEditState) _then;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object form = freezed,
    Object authUser = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      form: form == freezed ? _value.form : form as AuthUserEditForm,
      authUser: authUser == freezed ? _value.authUser : authUser as AuthUser,
    ));
  }

  @override
  $AuthUserEditFormCopyWith<$Res> get form {
    if (_value.form == null) {
      return null;
    }
    return $AuthUserEditFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
    });
  }

  @override
  $AuthUserCopyWith<$Res> get authUser {
    if (_value.authUser == null) {
      return null;
    }
    return $AuthUserCopyWith<$Res>(_value.authUser, (value) {
      return _then(_value.copyWith(authUser: value));
    });
  }
}

/// @nodoc
abstract class _$AuthUserEditStateCopyWith<$Res>
    implements $AuthUserEditStateCopyWith<$Res> {
  factory _$AuthUserEditStateCopyWith(
          _AuthUserEditState value, $Res Function(_AuthUserEditState) then) =
      __$AuthUserEditStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      AuthUserEditForm form,
      AuthUser authUser});

  @override
  $AuthUserEditFormCopyWith<$Res> get form;
  @override
  $AuthUserCopyWith<$Res> get authUser;
}

/// @nodoc
class __$AuthUserEditStateCopyWithImpl<$Res>
    extends _$AuthUserEditStateCopyWithImpl<$Res>
    implements _$AuthUserEditStateCopyWith<$Res> {
  __$AuthUserEditStateCopyWithImpl(
      _AuthUserEditState _value, $Res Function(_AuthUserEditState) _then)
      : super(_value, (v) => _then(v as _AuthUserEditState));

  @override
  _AuthUserEditState get _value => super._value as _AuthUserEditState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object form = freezed,
    Object authUser = freezed,
  }) {
    return _then(_AuthUserEditState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      form: form == freezed ? _value.form : form as AuthUserEditForm,
      authUser: authUser == freezed ? _value.authUser : authUser as AuthUser,
    ));
  }
}

/// @nodoc
class _$_AuthUserEditState implements _AuthUserEditState {
  _$_AuthUserEditState(
      {@required this.isProcessing,
      @nullable this.error,
      @required this.form,
      @required this.authUser})
      : assert(isProcessing != null),
        assert(form != null),
        assert(authUser != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final AuthUserEditForm form;
  @override
  final AuthUser authUser;

  bool _didcanSubmitForm = false;
  bool _canSubmitForm;

  @override
  bool get canSubmitForm {
    if (_didcanSubmitForm == false) {
      _didcanSubmitForm = true;
      _canSubmitForm = form.email.contains('@') && form.password.isNotEmpty;
    }
    return _canSubmitForm;
  }

  @override
  String toString() {
    return 'AuthUserEditState(isProcessing: $isProcessing, error: $error, form: $form, authUser: $authUser, canSubmitForm: $canSubmitForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthUserEditState &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.form, form) ||
                const DeepCollectionEquality().equals(other.form, form)) &&
            (identical(other.authUser, authUser) ||
                const DeepCollectionEquality()
                    .equals(other.authUser, authUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(form) ^
      const DeepCollectionEquality().hash(authUser);

  @JsonKey(ignore: true)
  @override
  _$AuthUserEditStateCopyWith<_AuthUserEditState> get copyWith =>
      __$AuthUserEditStateCopyWithImpl<_AuthUserEditState>(this, _$identity);
}

abstract class _AuthUserEditState implements AuthUserEditState {
  factory _AuthUserEditState(
      {@required bool isProcessing,
      @nullable Object error,
      @required AuthUserEditForm form,
      @required AuthUser authUser}) = _$_AuthUserEditState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  AuthUserEditForm get form;
  @override
  AuthUser get authUser;
  @override
  @JsonKey(ignore: true)
  _$AuthUserEditStateCopyWith<_AuthUserEditState> get copyWith;
}
