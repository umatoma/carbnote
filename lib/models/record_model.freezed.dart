// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RecordTearOff {
  const _$RecordTearOff();

// ignore: unused_element
  _Record call(
      {@nullable String id,
      @required String userID,
      @required RecordTimeType timeType,
      @required String name,
      @required String imageURL,
      @required int intakeGram,
      @required int carbGram,
      @required DateTime recordedAt,
      @required DateTime updatedAt,
      @required DateTime createdAt}) {
    return _Record(
      id: id,
      userID: userID,
      timeType: timeType,
      name: name,
      imageURL: imageURL,
      intakeGram: intakeGram,
      carbGram: carbGram,
      recordedAt: recordedAt,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Record = _$RecordTearOff();

/// @nodoc
mixin _$Record {
  @nullable
  String get id;
  String get userID;
  RecordTimeType get timeType;
  String get name;
  String get imageURL;
  int get intakeGram;
  int get carbGram;
  DateTime get recordedAt;
  DateTime get updatedAt;
  DateTime get createdAt;

  @JsonKey(ignore: true)
  $RecordCopyWith<Record> get copyWith;
}

/// @nodoc
abstract class $RecordCopyWith<$Res> {
  factory $RecordCopyWith(Record value, $Res Function(Record) then) =
      _$RecordCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      String userID,
      RecordTimeType timeType,
      String name,
      String imageURL,
      int intakeGram,
      int carbGram,
      DateTime recordedAt,
      DateTime updatedAt,
      DateTime createdAt});
}

/// @nodoc
class _$RecordCopyWithImpl<$Res> implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._value, this._then);

  final Record _value;
  // ignore: unused_field
  final $Res Function(Record) _then;

  @override
  $Res call({
    Object id = freezed,
    Object userID = freezed,
    Object timeType = freezed,
    Object name = freezed,
    Object imageURL = freezed,
    Object intakeGram = freezed,
    Object carbGram = freezed,
    Object recordedAt = freezed,
    Object updatedAt = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      userID: userID == freezed ? _value.userID : userID as String,
      timeType:
          timeType == freezed ? _value.timeType : timeType as RecordTimeType,
      name: name == freezed ? _value.name : name as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      intakeGram: intakeGram == freezed ? _value.intakeGram : intakeGram as int,
      carbGram: carbGram == freezed ? _value.carbGram : carbGram as int,
      recordedAt:
          recordedAt == freezed ? _value.recordedAt : recordedAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$RecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$RecordCopyWith(_Record value, $Res Function(_Record) then) =
      __$RecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      String userID,
      RecordTimeType timeType,
      String name,
      String imageURL,
      int intakeGram,
      int carbGram,
      DateTime recordedAt,
      DateTime updatedAt,
      DateTime createdAt});
}

/// @nodoc
class __$RecordCopyWithImpl<$Res> extends _$RecordCopyWithImpl<$Res>
    implements _$RecordCopyWith<$Res> {
  __$RecordCopyWithImpl(_Record _value, $Res Function(_Record) _then)
      : super(_value, (v) => _then(v as _Record));

  @override
  _Record get _value => super._value as _Record;

  @override
  $Res call({
    Object id = freezed,
    Object userID = freezed,
    Object timeType = freezed,
    Object name = freezed,
    Object imageURL = freezed,
    Object intakeGram = freezed,
    Object carbGram = freezed,
    Object recordedAt = freezed,
    Object updatedAt = freezed,
    Object createdAt = freezed,
  }) {
    return _then(_Record(
      id: id == freezed ? _value.id : id as String,
      userID: userID == freezed ? _value.userID : userID as String,
      timeType:
          timeType == freezed ? _value.timeType : timeType as RecordTimeType,
      name: name == freezed ? _value.name : name as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      intakeGram: intakeGram == freezed ? _value.intakeGram : intakeGram as int,
      carbGram: carbGram == freezed ? _value.carbGram : carbGram as int,
      recordedAt:
          recordedAt == freezed ? _value.recordedAt : recordedAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
    ));
  }
}

/// @nodoc
class _$_Record implements _Record {
  const _$_Record(
      {@nullable this.id,
      @required this.userID,
      @required this.timeType,
      @required this.name,
      @required this.imageURL,
      @required this.intakeGram,
      @required this.carbGram,
      @required this.recordedAt,
      @required this.updatedAt,
      @required this.createdAt})
      : assert(userID != null),
        assert(timeType != null),
        assert(name != null),
        assert(imageURL != null),
        assert(intakeGram != null),
        assert(carbGram != null),
        assert(recordedAt != null),
        assert(updatedAt != null),
        assert(createdAt != null);

  @override
  @nullable
  final String id;
  @override
  final String userID;
  @override
  final RecordTimeType timeType;
  @override
  final String name;
  @override
  final String imageURL;
  @override
  final int intakeGram;
  @override
  final int carbGram;
  @override
  final DateTime recordedAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Record(id: $id, userID: $userID, timeType: $timeType, name: $name, imageURL: $imageURL, intakeGram: $intakeGram, carbGram: $carbGram, recordedAt: $recordedAt, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Record &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.timeType, timeType) ||
                const DeepCollectionEquality()
                    .equals(other.timeType, timeType)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageURL, imageURL) ||
                const DeepCollectionEquality()
                    .equals(other.imageURL, imageURL)) &&
            (identical(other.intakeGram, intakeGram) ||
                const DeepCollectionEquality()
                    .equals(other.intakeGram, intakeGram)) &&
            (identical(other.carbGram, carbGram) ||
                const DeepCollectionEquality()
                    .equals(other.carbGram, carbGram)) &&
            (identical(other.recordedAt, recordedAt) ||
                const DeepCollectionEquality()
                    .equals(other.recordedAt, recordedAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(timeType) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageURL) ^
      const DeepCollectionEquality().hash(intakeGram) ^
      const DeepCollectionEquality().hash(carbGram) ^
      const DeepCollectionEquality().hash(recordedAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$RecordCopyWith<_Record> get copyWith =>
      __$RecordCopyWithImpl<_Record>(this, _$identity);
}

abstract class _Record implements Record {
  const factory _Record(
      {@nullable String id,
      @required String userID,
      @required RecordTimeType timeType,
      @required String name,
      @required String imageURL,
      @required int intakeGram,
      @required int carbGram,
      @required DateTime recordedAt,
      @required DateTime updatedAt,
      @required DateTime createdAt}) = _$_Record;

  @override
  @nullable
  String get id;
  @override
  String get userID;
  @override
  RecordTimeType get timeType;
  @override
  String get name;
  @override
  String get imageURL;
  @override
  int get intakeGram;
  @override
  int get carbGram;
  @override
  DateTime get recordedAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$RecordCopyWith<_Record> get copyWith;
}