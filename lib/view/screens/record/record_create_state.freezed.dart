// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'record_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RecordCreateFormTearOff {
  const _$RecordCreateFormTearOff();

// ignore: unused_element
  _RecordCreateForm call(
      {@required RecordTimeType timeType,
      @required String name,
      @nullable File imageFile,
      @required int intakeGram,
      @required int carbGram,
      @required DateTime recordedAt}) {
    return _RecordCreateForm(
      timeType: timeType,
      name: name,
      imageFile: imageFile,
      intakeGram: intakeGram,
      carbGram: carbGram,
      recordedAt: recordedAt,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RecordCreateForm = _$RecordCreateFormTearOff();

/// @nodoc
mixin _$RecordCreateForm {
  RecordTimeType get timeType;
  String get name;
  @nullable
  File get imageFile;
  int get intakeGram;
  int get carbGram;
  DateTime get recordedAt;

  @JsonKey(ignore: true)
  $RecordCreateFormCopyWith<RecordCreateForm> get copyWith;
}

/// @nodoc
abstract class $RecordCreateFormCopyWith<$Res> {
  factory $RecordCreateFormCopyWith(
          RecordCreateForm value, $Res Function(RecordCreateForm) then) =
      _$RecordCreateFormCopyWithImpl<$Res>;
  $Res call(
      {RecordTimeType timeType,
      String name,
      @nullable File imageFile,
      int intakeGram,
      int carbGram,
      DateTime recordedAt});
}

/// @nodoc
class _$RecordCreateFormCopyWithImpl<$Res>
    implements $RecordCreateFormCopyWith<$Res> {
  _$RecordCreateFormCopyWithImpl(this._value, this._then);

  final RecordCreateForm _value;
  // ignore: unused_field
  final $Res Function(RecordCreateForm) _then;

  @override
  $Res call({
    Object timeType = freezed,
    Object name = freezed,
    Object imageFile = freezed,
    Object intakeGram = freezed,
    Object carbGram = freezed,
    Object recordedAt = freezed,
  }) {
    return _then(_value.copyWith(
      timeType:
          timeType == freezed ? _value.timeType : timeType as RecordTimeType,
      name: name == freezed ? _value.name : name as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      intakeGram: intakeGram == freezed ? _value.intakeGram : intakeGram as int,
      carbGram: carbGram == freezed ? _value.carbGram : carbGram as int,
      recordedAt:
          recordedAt == freezed ? _value.recordedAt : recordedAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$RecordCreateFormCopyWith<$Res>
    implements $RecordCreateFormCopyWith<$Res> {
  factory _$RecordCreateFormCopyWith(
          _RecordCreateForm value, $Res Function(_RecordCreateForm) then) =
      __$RecordCreateFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {RecordTimeType timeType,
      String name,
      @nullable File imageFile,
      int intakeGram,
      int carbGram,
      DateTime recordedAt});
}

/// @nodoc
class __$RecordCreateFormCopyWithImpl<$Res>
    extends _$RecordCreateFormCopyWithImpl<$Res>
    implements _$RecordCreateFormCopyWith<$Res> {
  __$RecordCreateFormCopyWithImpl(
      _RecordCreateForm _value, $Res Function(_RecordCreateForm) _then)
      : super(_value, (v) => _then(v as _RecordCreateForm));

  @override
  _RecordCreateForm get _value => super._value as _RecordCreateForm;

  @override
  $Res call({
    Object timeType = freezed,
    Object name = freezed,
    Object imageFile = freezed,
    Object intakeGram = freezed,
    Object carbGram = freezed,
    Object recordedAt = freezed,
  }) {
    return _then(_RecordCreateForm(
      timeType:
          timeType == freezed ? _value.timeType : timeType as RecordTimeType,
      name: name == freezed ? _value.name : name as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      intakeGram: intakeGram == freezed ? _value.intakeGram : intakeGram as int,
      carbGram: carbGram == freezed ? _value.carbGram : carbGram as int,
      recordedAt:
          recordedAt == freezed ? _value.recordedAt : recordedAt as DateTime,
    ));
  }
}

/// @nodoc
class _$_RecordCreateForm implements _RecordCreateForm {
  _$_RecordCreateForm(
      {@required this.timeType,
      @required this.name,
      @nullable this.imageFile,
      @required this.intakeGram,
      @required this.carbGram,
      @required this.recordedAt})
      : assert(timeType != null),
        assert(name != null),
        assert(intakeGram != null),
        assert(carbGram != null),
        assert(recordedAt != null);

  @override
  final RecordTimeType timeType;
  @override
  final String name;
  @override
  @nullable
  final File imageFile;
  @override
  final int intakeGram;
  @override
  final int carbGram;
  @override
  final DateTime recordedAt;

  @override
  String toString() {
    return 'RecordCreateForm(timeType: $timeType, name: $name, imageFile: $imageFile, intakeGram: $intakeGram, carbGram: $carbGram, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecordCreateForm &&
            (identical(other.timeType, timeType) ||
                const DeepCollectionEquality()
                    .equals(other.timeType, timeType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.intakeGram, intakeGram) ||
                const DeepCollectionEquality()
                    .equals(other.intakeGram, intakeGram)) &&
            (identical(other.carbGram, carbGram) ||
                const DeepCollectionEquality()
                    .equals(other.carbGram, carbGram)) &&
            (identical(other.recordedAt, recordedAt) ||
                const DeepCollectionEquality()
                    .equals(other.recordedAt, recordedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timeType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(intakeGram) ^
      const DeepCollectionEquality().hash(carbGram) ^
      const DeepCollectionEquality().hash(recordedAt);

  @JsonKey(ignore: true)
  @override
  _$RecordCreateFormCopyWith<_RecordCreateForm> get copyWith =>
      __$RecordCreateFormCopyWithImpl<_RecordCreateForm>(this, _$identity);
}

abstract class _RecordCreateForm implements RecordCreateForm {
  factory _RecordCreateForm(
      {@required RecordTimeType timeType,
      @required String name,
      @nullable File imageFile,
      @required int intakeGram,
      @required int carbGram,
      @required DateTime recordedAt}) = _$_RecordCreateForm;

  @override
  RecordTimeType get timeType;
  @override
  String get name;
  @override
  @nullable
  File get imageFile;
  @override
  int get intakeGram;
  @override
  int get carbGram;
  @override
  DateTime get recordedAt;
  @override
  @JsonKey(ignore: true)
  _$RecordCreateFormCopyWith<_RecordCreateForm> get copyWith;
}

/// @nodoc
class _$RecordCreateStateTearOff {
  const _$RecordCreateStateTearOff();

// ignore: unused_element
  _RecordCreateState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required RecordCreateForm form,
      @required User user}) {
    return _RecordCreateState(
      isProcessing: isProcessing,
      error: error,
      form: form,
      user: user,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RecordCreateState = _$RecordCreateStateTearOff();

/// @nodoc
mixin _$RecordCreateState {
  bool get isProcessing;
  @nullable
  Object get error;
  RecordCreateForm get form;
  User get user;

  @JsonKey(ignore: true)
  $RecordCreateStateCopyWith<RecordCreateState> get copyWith;
}

/// @nodoc
abstract class $RecordCreateStateCopyWith<$Res> {
  factory $RecordCreateStateCopyWith(
          RecordCreateState value, $Res Function(RecordCreateState) then) =
      _$RecordCreateStateCopyWithImpl<$Res>;
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      RecordCreateForm form,
      User user});

  $RecordCreateFormCopyWith<$Res> get form;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$RecordCreateStateCopyWithImpl<$Res>
    implements $RecordCreateStateCopyWith<$Res> {
  _$RecordCreateStateCopyWithImpl(this._value, this._then);

  final RecordCreateState _value;
  // ignore: unused_field
  final $Res Function(RecordCreateState) _then;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object form = freezed,
    Object user = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      form: form == freezed ? _value.form : form as RecordCreateForm,
      user: user == freezed ? _value.user : user as User,
    ));
  }

  @override
  $RecordCreateFormCopyWith<$Res> get form {
    if (_value.form == null) {
      return null;
    }
    return $RecordCreateFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
    });
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
abstract class _$RecordCreateStateCopyWith<$Res>
    implements $RecordCreateStateCopyWith<$Res> {
  factory _$RecordCreateStateCopyWith(
          _RecordCreateState value, $Res Function(_RecordCreateState) then) =
      __$RecordCreateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      RecordCreateForm form,
      User user});

  @override
  $RecordCreateFormCopyWith<$Res> get form;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$RecordCreateStateCopyWithImpl<$Res>
    extends _$RecordCreateStateCopyWithImpl<$Res>
    implements _$RecordCreateStateCopyWith<$Res> {
  __$RecordCreateStateCopyWithImpl(
      _RecordCreateState _value, $Res Function(_RecordCreateState) _then)
      : super(_value, (v) => _then(v as _RecordCreateState));

  @override
  _RecordCreateState get _value => super._value as _RecordCreateState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object form = freezed,
    Object user = freezed,
  }) {
    return _then(_RecordCreateState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      form: form == freezed ? _value.form : form as RecordCreateForm,
      user: user == freezed ? _value.user : user as User,
    ));
  }
}

/// @nodoc
class _$_RecordCreateState implements _RecordCreateState {
  _$_RecordCreateState(
      {@required this.isProcessing,
      @nullable this.error,
      @required this.form,
      @required this.user})
      : assert(isProcessing != null),
        assert(form != null),
        assert(user != null);

  @override
  final bool isProcessing;
  @override
  @nullable
  final Object error;
  @override
  final RecordCreateForm form;
  @override
  final User user;

  bool _didcanSubmitForm = false;
  bool _canSubmitForm;

  @override
  bool get canSubmitForm {
    if (_didcanSubmitForm == false) {
      _didcanSubmitForm = true;
      _canSubmitForm = form.name.isNotEmpty;
    }
    return _canSubmitForm;
  }

  @override
  String toString() {
    return 'RecordCreateState(isProcessing: $isProcessing, error: $error, form: $form, user: $user, canSubmitForm: $canSubmitForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecordCreateState &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.form, form) ||
                const DeepCollectionEquality().equals(other.form, form)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(form) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$RecordCreateStateCopyWith<_RecordCreateState> get copyWith =>
      __$RecordCreateStateCopyWithImpl<_RecordCreateState>(this, _$identity);
}

abstract class _RecordCreateState implements RecordCreateState {
  factory _RecordCreateState(
      {@required bool isProcessing,
      @nullable Object error,
      @required RecordCreateForm form,
      @required User user}) = _$_RecordCreateState;

  @override
  bool get isProcessing;
  @override
  @nullable
  Object get error;
  @override
  RecordCreateForm get form;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$RecordCreateStateCopyWith<_RecordCreateState> get copyWith;
}
