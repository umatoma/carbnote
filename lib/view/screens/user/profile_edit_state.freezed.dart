// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'profile_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProfileEditFormTearOff {
  const _$ProfileEditFormTearOff();

// ignore: unused_element
  _ProfileEditForm call(
      {@required String nickname,
      @required String imageURL,
      @nullable File imageFile}) {
    return _ProfileEditForm(
      nickname: nickname,
      imageURL: imageURL,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProfileEditForm = _$ProfileEditFormTearOff();

/// @nodoc
mixin _$ProfileEditForm {
  String get nickname;
  String get imageURL;
  @nullable
  File get imageFile;

  @JsonKey(ignore: true)
  $ProfileEditFormCopyWith<ProfileEditForm> get copyWith;
}

/// @nodoc
abstract class $ProfileEditFormCopyWith<$Res> {
  factory $ProfileEditFormCopyWith(
          ProfileEditForm value, $Res Function(ProfileEditForm) then) =
      _$ProfileEditFormCopyWithImpl<$Res>;
  $Res call({String nickname, String imageURL, @nullable File imageFile});
}

/// @nodoc
class _$ProfileEditFormCopyWithImpl<$Res>
    implements $ProfileEditFormCopyWith<$Res> {
  _$ProfileEditFormCopyWithImpl(this._value, this._then);

  final ProfileEditForm _value;
  // ignore: unused_field
  final $Res Function(ProfileEditForm) _then;

  @override
  $Res call({
    Object nickname = freezed,
    Object imageURL = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
    ));
  }
}

/// @nodoc
abstract class _$ProfileEditFormCopyWith<$Res>
    implements $ProfileEditFormCopyWith<$Res> {
  factory _$ProfileEditFormCopyWith(
          _ProfileEditForm value, $Res Function(_ProfileEditForm) then) =
      __$ProfileEditFormCopyWithImpl<$Res>;
  @override
  $Res call({String nickname, String imageURL, @nullable File imageFile});
}

/// @nodoc
class __$ProfileEditFormCopyWithImpl<$Res>
    extends _$ProfileEditFormCopyWithImpl<$Res>
    implements _$ProfileEditFormCopyWith<$Res> {
  __$ProfileEditFormCopyWithImpl(
      _ProfileEditForm _value, $Res Function(_ProfileEditForm) _then)
      : super(_value, (v) => _then(v as _ProfileEditForm));

  @override
  _ProfileEditForm get _value => super._value as _ProfileEditForm;

  @override
  $Res call({
    Object nickname = freezed,
    Object imageURL = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_ProfileEditForm(
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
    ));
  }
}

/// @nodoc
class _$_ProfileEditForm implements _ProfileEditForm {
  _$_ProfileEditForm(
      {@required this.nickname,
      @required this.imageURL,
      @nullable this.imageFile})
      : assert(nickname != null),
        assert(imageURL != null);

  @override
  final String nickname;
  @override
  final String imageURL;
  @override
  @nullable
  final File imageFile;

  @override
  String toString() {
    return 'ProfileEditForm(nickname: $nickname, imageURL: $imageURL, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileEditForm &&
            (identical(other.nickname, nickname) ||
                const DeepCollectionEquality()
                    .equals(other.nickname, nickname)) &&
            (identical(other.imageURL, imageURL) ||
                const DeepCollectionEquality()
                    .equals(other.imageURL, imageURL)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nickname) ^
      const DeepCollectionEquality().hash(imageURL) ^
      const DeepCollectionEquality().hash(imageFile);

  @JsonKey(ignore: true)
  @override
  _$ProfileEditFormCopyWith<_ProfileEditForm> get copyWith =>
      __$ProfileEditFormCopyWithImpl<_ProfileEditForm>(this, _$identity);
}

abstract class _ProfileEditForm implements ProfileEditForm {
  factory _ProfileEditForm(
      {@required String nickname,
      @required String imageURL,
      @nullable File imageFile}) = _$_ProfileEditForm;

  @override
  String get nickname;
  @override
  String get imageURL;
  @override
  @nullable
  File get imageFile;
  @override
  @JsonKey(ignore: true)
  _$ProfileEditFormCopyWith<_ProfileEditForm> get copyWith;
}

/// @nodoc
class _$ProfileEditStateTearOff {
  const _$ProfileEditStateTearOff();

// ignore: unused_element
  _ProfileEditState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required ProfileEditForm form}) {
    return _ProfileEditState(
      isProcessing: isProcessing,
      error: error,
      form: form,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProfileEditState = _$ProfileEditStateTearOff();

/// @nodoc
mixin _$ProfileEditState {
  bool get isProcessing;
  @nullable
  Object get error;
  ProfileEditForm get form;

  @JsonKey(ignore: true)
  $ProfileEditStateCopyWith<ProfileEditState> get copyWith;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
          ProfileEditState value, $Res Function(ProfileEditState) then) =
      _$ProfileEditStateCopyWithImpl<$Res>;
  $Res call({bool isProcessing, @nullable Object error, ProfileEditForm form});

  $ProfileEditFormCopyWith<$Res> get form;
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

  final ProfileEditState _value;
  // ignore: unused_field
  final $Res Function(ProfileEditState) _then;

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
      form: form == freezed ? _value.form : form as ProfileEditForm,
    ));
  }

  @override
  $ProfileEditFormCopyWith<$Res> get form {
    if (_value.form == null) {
      return null;
    }
    return $ProfileEditFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
    });
  }
}

/// @nodoc
abstract class _$ProfileEditStateCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory _$ProfileEditStateCopyWith(
          _ProfileEditState value, $Res Function(_ProfileEditState) then) =
      __$ProfileEditStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isProcessing, @nullable Object error, ProfileEditForm form});

  @override
  $ProfileEditFormCopyWith<$Res> get form;
}

/// @nodoc
class __$ProfileEditStateCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res>
    implements _$ProfileEditStateCopyWith<$Res> {
  __$ProfileEditStateCopyWithImpl(
      _ProfileEditState _value, $Res Function(_ProfileEditState) _then)
      : super(_value, (v) => _then(v as _ProfileEditState));

  @override
  _ProfileEditState get _value => super._value as _ProfileEditState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object form = freezed,
  }) {
    return _then(_ProfileEditState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      form: form == freezed ? _value.form : form as ProfileEditForm,
    ));
  }
}

/// @nodoc
class _$_ProfileEditState implements _ProfileEditState {
  _$_ProfileEditState(
      {@required this.isProcessing, @nullable this.error, @required this.form})
      : assert(isProcessing != null),
        assert(form != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final ProfileEditForm form;

  @override
  String toString() {
    return 'ProfileEditState(isProcessing: $isProcessing, error: $error, form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileEditState &&
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
  _$ProfileEditStateCopyWith<_ProfileEditState> get copyWith =>
      __$ProfileEditStateCopyWithImpl<_ProfileEditState>(this, _$identity);
}

abstract class _ProfileEditState implements ProfileEditState {
  factory _ProfileEditState(
      {@required bool isProcessing,
      @nullable Object error,
      @required ProfileEditForm form}) = _$_ProfileEditState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  ProfileEditForm get form;
  @override
  @JsonKey(ignore: true)
  _$ProfileEditStateCopyWith<_ProfileEditState> get copyWith;
}
