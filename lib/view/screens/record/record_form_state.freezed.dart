// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'record_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RecordFormStateTearOff {
  const _$RecordFormStateTearOff();

// ignore: unused_element
  _RecordFormState call(
      {@required bool isProcessing,
      @nullable Object error,
      @required User user,
      @nullable File imageFile,
      @required Record record}) {
    return _RecordFormState(
      isProcessing: isProcessing,
      error: error,
      user: user,
      imageFile: imageFile,
      record: record,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RecordFormState = _$RecordFormStateTearOff();

/// @nodoc
mixin _$RecordFormState {
  bool get isProcessing;
  @nullable
  Object get error;
  User get user;
  @nullable
  File get imageFile;
  Record get record;

  @JsonKey(ignore: true)
  $RecordFormStateCopyWith<RecordFormState> get copyWith;
}

/// @nodoc
abstract class $RecordFormStateCopyWith<$Res> {
  factory $RecordFormStateCopyWith(
          RecordFormState value, $Res Function(RecordFormState) then) =
      _$RecordFormStateCopyWithImpl<$Res>;
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      User user,
      @nullable File imageFile,
      Record record});

  $UserCopyWith<$Res> get user;
  $RecordCopyWith<$Res> get record;
}

/// @nodoc
class _$RecordFormStateCopyWithImpl<$Res>
    implements $RecordFormStateCopyWith<$Res> {
  _$RecordFormStateCopyWithImpl(this._value, this._then);

  final RecordFormState _value;
  // ignore: unused_field
  final $Res Function(RecordFormState) _then;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object user = freezed,
    Object imageFile = freezed,
    Object record = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed ? _value.user : user as User,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      record: record == freezed ? _value.record : record as Record,
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

  @override
  $RecordCopyWith<$Res> get record {
    if (_value.record == null) {
      return null;
    }
    return $RecordCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc
abstract class _$RecordFormStateCopyWith<$Res>
    implements $RecordFormStateCopyWith<$Res> {
  factory _$RecordFormStateCopyWith(
          _RecordFormState value, $Res Function(_RecordFormState) then) =
      __$RecordFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isProcessing,
      @nullable Object error,
      User user,
      @nullable File imageFile,
      Record record});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $RecordCopyWith<$Res> get record;
}

/// @nodoc
class __$RecordFormStateCopyWithImpl<$Res>
    extends _$RecordFormStateCopyWithImpl<$Res>
    implements _$RecordFormStateCopyWith<$Res> {
  __$RecordFormStateCopyWithImpl(
      _RecordFormState _value, $Res Function(_RecordFormState) _then)
      : super(_value, (v) => _then(v as _RecordFormState));

  @override
  _RecordFormState get _value => super._value as _RecordFormState;

  @override
  $Res call({
    Object isProcessing = freezed,
    Object error = freezed,
    Object user = freezed,
    Object imageFile = freezed,
    Object record = freezed,
  }) {
    return _then(_RecordFormState(
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed ? _value.user : user as User,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      record: record == freezed ? _value.record : record as Record,
    ));
  }
}

/// @nodoc
class _$_RecordFormState implements _RecordFormState {
  _$_RecordFormState(
      {@required this.isProcessing,
      @nullable this.error,
      @required this.user,
      @nullable this.imageFile,
      @required this.record})
      : assert(isProcessing != null),
        assert(user != null),
        assert(record != null);

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
  final Record record;

  bool _didcanSubmitForm = false;
  bool _canSubmitForm;

  @override
  bool get canSubmitForm {
    if (_didcanSubmitForm == false) {
      _didcanSubmitForm = true;
      _canSubmitForm = record.name.isNotEmpty;
    }
    return _canSubmitForm;
  }

  bool _didisUpdate = false;
  bool _isUpdate;

  @override
  bool get isUpdate {
    if (_didisUpdate == false) {
      _didisUpdate = true;
      _isUpdate = record.id != null;
    }
    return _isUpdate;
  }

  @override
  String toString() {
    return 'RecordFormState(isProcessing: $isProcessing, error: $error, user: $user, imageFile: $imageFile, record: $record, canSubmitForm: $canSubmitForm, isUpdate: $isUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecordFormState &&
            (identical(other.isProcessing, isProcessing) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessing, isProcessing)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.record, record) ||
                const DeepCollectionEquality().equals(other.record, record)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isProcessing) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(record);

  @JsonKey(ignore: true)
  @override
  _$RecordFormStateCopyWith<_RecordFormState> get copyWith =>
      __$RecordFormStateCopyWithImpl<_RecordFormState>(this, _$identity);
}

abstract class _RecordFormState implements RecordFormState {
  factory _RecordFormState(
      {@required bool isProcessing,
      @nullable Object error,
      @required User user,
      @nullable File imageFile,
      @required Record record}) = _$_RecordFormState;

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
  Record get record;
  @override
  @JsonKey(ignore: true)
  _$RecordFormStateCopyWith<_RecordFormState> get copyWith;
}
