// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserEditFormTearOff {
  const _$UserEditFormTearOff();

// ignore: unused_element
  _UserEditForm call(
      {@required String nickname,
      @required String imageURL,
      @nullable File imageFile,
      @required int goalCarbGram}) {
    return _UserEditForm(
      nickname: nickname,
      imageURL: imageURL,
      imageFile: imageFile,
      goalCarbGram: goalCarbGram,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserEditForm = _$UserEditFormTearOff();

/// @nodoc
mixin _$UserEditForm {
  String get nickname;
  String get imageURL;
  @nullable
  File get imageFile;
  int get goalCarbGram;

  @JsonKey(ignore: true)
  $UserEditFormCopyWith<UserEditForm> get copyWith;
}

/// @nodoc
abstract class $UserEditFormCopyWith<$Res> {
  factory $UserEditFormCopyWith(
          UserEditForm value, $Res Function(UserEditForm) then) =
      _$UserEditFormCopyWithImpl<$Res>;
  $Res call(
      {String nickname,
      String imageURL,
      @nullable File imageFile,
      int goalCarbGram});
}

/// @nodoc
class _$UserEditFormCopyWithImpl<$Res> implements $UserEditFormCopyWith<$Res> {
  _$UserEditFormCopyWithImpl(this._value, this._then);

  final UserEditForm _value;
  // ignore: unused_field
  final $Res Function(UserEditForm) _then;

  @override
  $Res call({
    Object nickname = freezed,
    Object imageURL = freezed,
    Object imageFile = freezed,
    Object goalCarbGram = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
    ));
  }
}

/// @nodoc
abstract class _$UserEditFormCopyWith<$Res>
    implements $UserEditFormCopyWith<$Res> {
  factory _$UserEditFormCopyWith(
          _UserEditForm value, $Res Function(_UserEditForm) then) =
      __$UserEditFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {String nickname,
      String imageURL,
      @nullable File imageFile,
      int goalCarbGram});
}

/// @nodoc
class __$UserEditFormCopyWithImpl<$Res> extends _$UserEditFormCopyWithImpl<$Res>
    implements _$UserEditFormCopyWith<$Res> {
  __$UserEditFormCopyWithImpl(
      _UserEditForm _value, $Res Function(_UserEditForm) _then)
      : super(_value, (v) => _then(v as _UserEditForm));

  @override
  _UserEditForm get _value => super._value as _UserEditForm;

  @override
  $Res call({
    Object nickname = freezed,
    Object imageURL = freezed,
    Object imageFile = freezed,
    Object goalCarbGram = freezed,
  }) {
    return _then(_UserEditForm(
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
    ));
  }
}

/// @nodoc
class _$_UserEditForm implements _UserEditForm {
  _$_UserEditForm(
      {@required this.nickname,
      @required this.imageURL,
      @nullable this.imageFile,
      @required this.goalCarbGram})
      : assert(nickname != null),
        assert(imageURL != null),
        assert(goalCarbGram != null);

  @override
  final String nickname;
  @override
  final String imageURL;
  @override
  @nullable
  final File imageFile;
  @override
  final int goalCarbGram;

  @override
  String toString() {
    return 'UserEditForm(nickname: $nickname, imageURL: $imageURL, imageFile: $imageFile, goalCarbGram: $goalCarbGram)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEditForm &&
            (identical(other.nickname, nickname) ||
                const DeepCollectionEquality()
                    .equals(other.nickname, nickname)) &&
            (identical(other.imageURL, imageURL) ||
                const DeepCollectionEquality()
                    .equals(other.imageURL, imageURL)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.goalCarbGram, goalCarbGram) ||
                const DeepCollectionEquality()
                    .equals(other.goalCarbGram, goalCarbGram)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nickname) ^
      const DeepCollectionEquality().hash(imageURL) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(goalCarbGram);

  @JsonKey(ignore: true)
  @override
  _$UserEditFormCopyWith<_UserEditForm> get copyWith =>
      __$UserEditFormCopyWithImpl<_UserEditForm>(this, _$identity);
}

abstract class _UserEditForm implements UserEditForm {
  factory _UserEditForm(
      {@required String nickname,
      @required String imageURL,
      @nullable File imageFile,
      @required int goalCarbGram}) = _$_UserEditForm;

  @override
  String get nickname;
  @override
  String get imageURL;
  @override
  @nullable
  File get imageFile;
  @override
  int get goalCarbGram;
  @override
  @JsonKey(ignore: true)
  _$UserEditFormCopyWith<_UserEditForm> get copyWith;
}

/// @nodoc
class _$UserEditStateTearOff {
  const _$UserEditStateTearOff();

// ignore: unused_element
  _UserEditState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required UserEditForm form}) {
    return _UserEditState(
      isProcessing: isProcessing,
      error: error,
      form: form,
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
  UserEditForm get form;

  @JsonKey(ignore: true)
  $UserEditStateCopyWith<UserEditState> get copyWith;
}

/// @nodoc
abstract class $UserEditStateCopyWith<$Res> {
  factory $UserEditStateCopyWith(
          UserEditState value, $Res Function(UserEditState) then) =
      _$UserEditStateCopyWithImpl<$Res>;
  $Res call({bool isProcessing, @nullable Object error, UserEditForm form});

  $UserEditFormCopyWith<$Res> get form;
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
    Object form = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      form: form == freezed ? _value.form : form as UserEditForm,
    ));
  }

  @override
  $UserEditFormCopyWith<$Res> get form {
    if (_value.form == null) {
      return null;
    }
    return $UserEditFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
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
  $Res call({bool isProcessing, @nullable Object error, UserEditForm form});

  @override
  $UserEditFormCopyWith<$Res> get form;
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
    Object form = freezed,
  }) {
    return _then(_UserEditState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      form: form == freezed ? _value.form : form as UserEditForm,
    ));
  }
}

/// @nodoc
class _$_UserEditState implements _UserEditState {
  _$_UserEditState(
      {@required this.isProcessing, @nullable this.error, @required this.form})
      : assert(isProcessing != null),
        assert(form != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final UserEditForm form;

  @override
  String toString() {
    return 'UserEditState(isProcessing: $isProcessing, error: $error, form: $form)';
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
            (identical(other.form, form) ||
                const DeepCollectionEquality().equals(other.form, form)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(form);

  @JsonKey(ignore: true)
  @override
  _$UserEditStateCopyWith<_UserEditState> get copyWith =>
      __$UserEditStateCopyWithImpl<_UserEditState>(this, _$identity);
}

abstract class _UserEditState implements UserEditState {
  factory _UserEditState(
      {@required bool isProcessing,
      @nullable Object error,
      @required UserEditForm form}) = _$_UserEditState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  UserEditForm get form;
  @override
  @JsonKey(ignore: true)
  _$UserEditStateCopyWith<_UserEditState> get copyWith;
}
