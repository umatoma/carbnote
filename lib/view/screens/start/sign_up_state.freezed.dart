// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SignUpFormTearOff {
  const _$SignUpFormTearOff();

// ignore: unused_element
  _SignUpForm call(
      {@required int goalCarbGram,
      @nullable File imageFile,
      @required String nickname,
      @required String email,
      @required String password}) {
    return _SignUpForm(
      goalCarbGram: goalCarbGram,
      imageFile: imageFile,
      nickname: nickname,
      email: email,
      password: password,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignUpForm = _$SignUpFormTearOff();

/// @nodoc
mixin _$SignUpForm {
  int get goalCarbGram;
  @nullable
  File get imageFile;
  String get nickname;
  String get email;
  String get password;

  @JsonKey(ignore: true)
  $SignUpFormCopyWith<SignUpForm> get copyWith;
}

/// @nodoc
abstract class $SignUpFormCopyWith<$Res> {
  factory $SignUpFormCopyWith(
          SignUpForm value, $Res Function(SignUpForm) then) =
      _$SignUpFormCopyWithImpl<$Res>;
  $Res call(
      {int goalCarbGram,
      @nullable File imageFile,
      String nickname,
      String email,
      String password});
}

/// @nodoc
class _$SignUpFormCopyWithImpl<$Res> implements $SignUpFormCopyWith<$Res> {
  _$SignUpFormCopyWithImpl(this._value, this._then);

  final SignUpForm _value;
  // ignore: unused_field
  final $Res Function(SignUpForm) _then;

  @override
  $Res call({
    Object goalCarbGram = freezed,
    Object imageFile = freezed,
    Object nickname = freezed,
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
abstract class _$SignUpFormCopyWith<$Res> implements $SignUpFormCopyWith<$Res> {
  factory _$SignUpFormCopyWith(
          _SignUpForm value, $Res Function(_SignUpForm) then) =
      __$SignUpFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {int goalCarbGram,
      @nullable File imageFile,
      String nickname,
      String email,
      String password});
}

/// @nodoc
class __$SignUpFormCopyWithImpl<$Res> extends _$SignUpFormCopyWithImpl<$Res>
    implements _$SignUpFormCopyWith<$Res> {
  __$SignUpFormCopyWithImpl(
      _SignUpForm _value, $Res Function(_SignUpForm) _then)
      : super(_value, (v) => _then(v as _SignUpForm));

  @override
  _SignUpForm get _value => super._value as _SignUpForm;

  @override
  $Res call({
    Object goalCarbGram = freezed,
    Object imageFile = freezed,
    Object nickname = freezed,
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_SignUpForm(
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$_SignUpForm implements _SignUpForm {
  _$_SignUpForm(
      {@required this.goalCarbGram,
      @nullable this.imageFile,
      @required this.nickname,
      @required this.email,
      @required this.password})
      : assert(goalCarbGram != null),
        assert(nickname != null),
        assert(email != null),
        assert(password != null);

  @override
  final int goalCarbGram;
  @override
  @nullable
  final File imageFile;
  @override
  final String nickname;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpForm(goalCarbGram: $goalCarbGram, imageFile: $imageFile, nickname: $nickname, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpForm &&
            (identical(other.goalCarbGram, goalCarbGram) ||
                const DeepCollectionEquality()
                    .equals(other.goalCarbGram, goalCarbGram)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.nickname, nickname) ||
                const DeepCollectionEquality()
                    .equals(other.nickname, nickname)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goalCarbGram) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(nickname) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$SignUpFormCopyWith<_SignUpForm> get copyWith =>
      __$SignUpFormCopyWithImpl<_SignUpForm>(this, _$identity);
}

abstract class _SignUpForm implements SignUpForm {
  factory _SignUpForm(
      {@required int goalCarbGram,
      @nullable File imageFile,
      @required String nickname,
      @required String email,
      @required String password}) = _$_SignUpForm;

  @override
  int get goalCarbGram;
  @override
  @nullable
  File get imageFile;
  @override
  String get nickname;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignUpFormCopyWith<_SignUpForm> get copyWith;
}

/// @nodoc
class _$SignUpStateTearOff {
  const _$SignUpStateTearOff();

// ignore: unused_element
  _SignUpState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required int page,
      @required int itemCount,
      @required PageController controller,
      @required SignUpForm form}) {
    return _SignUpState(
      isProcessing: isProcessing,
      error: error,
      page: page,
      itemCount: itemCount,
      controller: controller,
      form: form,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignUpState = _$SignUpStateTearOff();

/// @nodoc
mixin _$SignUpState {
  bool get isProcessing;
  @nullable
  Object get error;
  int get page;
  int get itemCount;
  PageController get controller;
  SignUpForm get form;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      int page,
      int itemCount,
      PageController controller,
      SignUpForm form});

  $SignUpFormCopyWith<$Res> get form;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object page = freezed,
    Object itemCount = freezed,
    Object controller = freezed,
    Object form = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      page: page == freezed ? _value.page : page as int,
      itemCount: itemCount == freezed ? _value.itemCount : itemCount as int,
      controller: controller == freezed
          ? _value.controller
          : controller as PageController,
      form: form == freezed ? _value.form : form as SignUpForm,
    ));
  }

  @override
  $SignUpFormCopyWith<$Res> get form {
    if (_value.form == null) {
      return null;
    }
    return $SignUpFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
    });
  }
}

/// @nodoc
abstract class _$SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(
          _SignUpState value, $Res Function(_SignUpState) then) =
      __$SignUpStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      int page,
      int itemCount,
      PageController controller,
      SignUpForm form});

  @override
  $SignUpFormCopyWith<$Res> get form;
}

/// @nodoc
class __$SignUpStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(
      _SignUpState _value, $Res Function(_SignUpState) _then)
      : super(_value, (v) => _then(v as _SignUpState));

  @override
  _SignUpState get _value => super._value as _SignUpState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object page = freezed,
    Object itemCount = freezed,
    Object controller = freezed,
    Object form = freezed,
  }) {
    return _then(_SignUpState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      page: page == freezed ? _value.page : page as int,
      itemCount: itemCount == freezed ? _value.itemCount : itemCount as int,
      controller: controller == freezed
          ? _value.controller
          : controller as PageController,
      form: form == freezed ? _value.form : form as SignUpForm,
    ));
  }
}

/// @nodoc
class _$_SignUpState implements _SignUpState {
  _$_SignUpState(
      {@required this.isProcessing,
      @nullable this.error,
      @required this.page,
      @required this.itemCount,
      @required this.controller,
      @required this.form})
      : assert(isProcessing != null),
        assert(page != null),
        assert(itemCount != null),
        assert(controller != null),
        assert(form != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final int page;
  @override
  final int itemCount;
  @override
  final PageController controller;
  @override
  final SignUpForm form;

  bool _didcanSubmitProfile = false;
  bool _canSubmitProfile;

  @override
  bool get canSubmitProfile {
    if (_didcanSubmitProfile == false) {
      _didcanSubmitProfile = true;
      _canSubmitProfile = form.nickname.isNotEmpty;
    }
    return _canSubmitProfile;
  }

  bool _didcanSubmitSignInSetting = false;
  bool _canSubmitSignInSetting;

  @override
  bool get canSubmitSignInSetting {
    if (_didcanSubmitSignInSetting == false) {
      _didcanSubmitSignInSetting = true;
      _canSubmitSignInSetting = form.email.isNotEmpty &&
          form.email.contains('@') &&
          form.password.isNotEmpty;
    }
    return _canSubmitSignInSetting;
  }

  @override
  String toString() {
    return 'SignUpState(isProcessing: $isProcessing, error: $error, page: $page, itemCount: $itemCount, controller: $controller, form: $form, canSubmitProfile: $canSubmitProfile, canSubmitSignInSetting: $canSubmitSignInSetting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpState &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.itemCount, itemCount) ||
                const DeepCollectionEquality()
                    .equals(other.itemCount, itemCount)) &&
            (identical(other.controller, controller) ||
                const DeepCollectionEquality()
                    .equals(other.controller, controller)) &&
            (identical(other.form, form) ||
                const DeepCollectionEquality().equals(other.form, form)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(itemCount) ^
      const DeepCollectionEquality().hash(controller) ^
      const DeepCollectionEquality().hash(form);

  @JsonKey(ignore: true)
  @override
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  factory _SignUpState(
      {@required bool isProcessing,
      @nullable Object error,
      @required int page,
      @required int itemCount,
      @required PageController controller,
      @required SignUpForm form}) = _$_SignUpState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  int get page;
  @override
  int get itemCount;
  @override
  PageController get controller;
  @override
  SignUpForm get form;
  @override
  @JsonKey(ignore: true)
  _$SignUpStateCopyWith<_SignUpState> get copyWith;
}
