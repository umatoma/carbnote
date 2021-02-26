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
      RecordTimeType timeType = RecordTimeType.breakfast,
      String name = '',
      String note = '',
      @nullable String imageURL,
      String unit = '',
      double carbGramPerUnit = 0,
      double intakePercent = 1.0,
      @required DateTime recordedAt,
      @nullable DateTime updatedAt,
      @nullable DateTime createdAt}) {
    return _Record(
      id: id,
      userID: userID,
      timeType: timeType,
      name: name,
      note: note,
      imageURL: imageURL,
      unit: unit,
      carbGramPerUnit: carbGramPerUnit,
      intakePercent: intakePercent,
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
  String get note;
  @nullable
  String get imageURL;
  String get unit;
  double get carbGramPerUnit;
  double get intakePercent;
  DateTime get recordedAt;
  @nullable
  DateTime get updatedAt;
  @nullable
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
      String note,
      @nullable String imageURL,
      String unit,
      double carbGramPerUnit,
      double intakePercent,
      DateTime recordedAt,
      @nullable DateTime updatedAt,
      @nullable DateTime createdAt});
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
    Object note = freezed,
    Object imageURL = freezed,
    Object unit = freezed,
    Object carbGramPerUnit = freezed,
    Object intakePercent = freezed,
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
      note: note == freezed ? _value.note : note as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      unit: unit == freezed ? _value.unit : unit as String,
      carbGramPerUnit: carbGramPerUnit == freezed
          ? _value.carbGramPerUnit
          : carbGramPerUnit as double,
      intakePercent: intakePercent == freezed
          ? _value.intakePercent
          : intakePercent as double,
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
      String note,
      @nullable String imageURL,
      String unit,
      double carbGramPerUnit,
      double intakePercent,
      DateTime recordedAt,
      @nullable DateTime updatedAt,
      @nullable DateTime createdAt});
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
    Object note = freezed,
    Object imageURL = freezed,
    Object unit = freezed,
    Object carbGramPerUnit = freezed,
    Object intakePercent = freezed,
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
      note: note == freezed ? _value.note : note as String,
      imageURL: imageURL == freezed ? _value.imageURL : imageURL as String,
      unit: unit == freezed ? _value.unit : unit as String,
      carbGramPerUnit: carbGramPerUnit == freezed
          ? _value.carbGramPerUnit
          : carbGramPerUnit as double,
      intakePercent: intakePercent == freezed
          ? _value.intakePercent
          : intakePercent as double,
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
class _$_Record extends _Record {
  _$_Record(
      {@nullable this.id,
      @required this.userID,
      this.timeType = RecordTimeType.breakfast,
      this.name = '',
      this.note = '',
      @nullable this.imageURL,
      this.unit = '',
      this.carbGramPerUnit = 0,
      this.intakePercent = 1.0,
      @required this.recordedAt,
      @nullable this.updatedAt,
      @nullable this.createdAt})
      : assert(userID != null),
        assert(timeType != null),
        assert(name != null),
        assert(note != null),
        assert(unit != null),
        assert(carbGramPerUnit != null),
        assert(intakePercent != null),
        assert(recordedAt != null),
        super._();

  @override
  @nullable
  final String id;
  @override
  final String userID;
  @JsonKey(defaultValue: RecordTimeType.breakfast)
  @override
  final RecordTimeType timeType;
  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String note;
  @override
  @nullable
  final String imageURL;
  @JsonKey(defaultValue: '')
  @override
  final String unit;
  @JsonKey(defaultValue: 0)
  @override
  final double carbGramPerUnit;
  @JsonKey(defaultValue: 1.0)
  @override
  final double intakePercent;
  @override
  final DateTime recordedAt;
  @override
  @nullable
  final DateTime updatedAt;
  @override
  @nullable
  final DateTime createdAt;

  bool _didcarbGram = false;
  int _carbGram;

  @override
  int get carbGram {
    if (_didcarbGram == false) {
      _didcarbGram = true;
      _carbGram = (carbGramPerUnit * intakePercent).round();
    }
    return _carbGram;
  }

  @override
  String toString() {
    return 'Record(id: $id, userID: $userID, timeType: $timeType, name: $name, note: $note, imageURL: $imageURL, unit: $unit, carbGramPerUnit: $carbGramPerUnit, intakePercent: $intakePercent, recordedAt: $recordedAt, updatedAt: $updatedAt, createdAt: $createdAt, carbGram: $carbGram)';
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
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.imageURL, imageURL) ||
                const DeepCollectionEquality()
                    .equals(other.imageURL, imageURL)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.carbGramPerUnit, carbGramPerUnit) ||
                const DeepCollectionEquality()
                    .equals(other.carbGramPerUnit, carbGramPerUnit)) &&
            (identical(other.intakePercent, intakePercent) ||
                const DeepCollectionEquality()
                    .equals(other.intakePercent, intakePercent)) &&
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
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(imageURL) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(carbGramPerUnit) ^
      const DeepCollectionEquality().hash(intakePercent) ^
      const DeepCollectionEquality().hash(recordedAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$RecordCopyWith<_Record> get copyWith =>
      __$RecordCopyWithImpl<_Record>(this, _$identity);
}

abstract class _Record extends Record {
  _Record._() : super._();
  factory _Record(
      {@nullable String id,
      @required String userID,
      RecordTimeType timeType,
      String name,
      String note,
      @nullable String imageURL,
      String unit,
      double carbGramPerUnit,
      double intakePercent,
      @required DateTime recordedAt,
      @nullable DateTime updatedAt,
      @nullable DateTime createdAt}) = _$_Record;

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
  String get note;
  @override
  @nullable
  String get imageURL;
  @override
  String get unit;
  @override
  double get carbGramPerUnit;
  @override
  double get intakePercent;
  @override
  DateTime get recordedAt;
  @override
  @nullable
  DateTime get updatedAt;
  @override
  @nullable
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$RecordCopyWith<_Record> get copyWith;
}

/// @nodoc
class _$RecordsSummaryTearOff {
  const _$RecordsSummaryTearOff();

// ignore: unused_element
  _RecordsSummary call(
      {@required int goalCarbGram, @required List<Record> records}) {
    return _RecordsSummary(
      goalCarbGram: goalCarbGram,
      records: records,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RecordsSummary = _$RecordsSummaryTearOff();

/// @nodoc
mixin _$RecordsSummary {
  int get goalCarbGram;
  List<Record> get records;

  @JsonKey(ignore: true)
  $RecordsSummaryCopyWith<RecordsSummary> get copyWith;
}

/// @nodoc
abstract class $RecordsSummaryCopyWith<$Res> {
  factory $RecordsSummaryCopyWith(
          RecordsSummary value, $Res Function(RecordsSummary) then) =
      _$RecordsSummaryCopyWithImpl<$Res>;
  $Res call({int goalCarbGram, List<Record> records});
}

/// @nodoc
class _$RecordsSummaryCopyWithImpl<$Res>
    implements $RecordsSummaryCopyWith<$Res> {
  _$RecordsSummaryCopyWithImpl(this._value, this._then);

  final RecordsSummary _value;
  // ignore: unused_field
  final $Res Function(RecordsSummary) _then;

  @override
  $Res call({
    Object goalCarbGram = freezed,
    Object records = freezed,
  }) {
    return _then(_value.copyWith(
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
      records: records == freezed ? _value.records : records as List<Record>,
    ));
  }
}

/// @nodoc
abstract class _$RecordsSummaryCopyWith<$Res>
    implements $RecordsSummaryCopyWith<$Res> {
  factory _$RecordsSummaryCopyWith(
          _RecordsSummary value, $Res Function(_RecordsSummary) then) =
      __$RecordsSummaryCopyWithImpl<$Res>;
  @override
  $Res call({int goalCarbGram, List<Record> records});
}

/// @nodoc
class __$RecordsSummaryCopyWithImpl<$Res>
    extends _$RecordsSummaryCopyWithImpl<$Res>
    implements _$RecordsSummaryCopyWith<$Res> {
  __$RecordsSummaryCopyWithImpl(
      _RecordsSummary _value, $Res Function(_RecordsSummary) _then)
      : super(_value, (v) => _then(v as _RecordsSummary));

  @override
  _RecordsSummary get _value => super._value as _RecordsSummary;

  @override
  $Res call({
    Object goalCarbGram = freezed,
    Object records = freezed,
  }) {
    return _then(_RecordsSummary(
      goalCarbGram:
          goalCarbGram == freezed ? _value.goalCarbGram : goalCarbGram as int,
      records: records == freezed ? _value.records : records as List<Record>,
    ));
  }
}

/// @nodoc
class _$_RecordsSummary extends _RecordsSummary {
  _$_RecordsSummary({@required this.goalCarbGram, @required this.records})
      : assert(goalCarbGram != null),
        assert(records != null),
        super._();

  @override
  final int goalCarbGram;
  @override
  final List<Record> records;

  bool _didsummariesGroupByRecordedDay = false;
  Map<DateTime, RecordsSummary> _summariesGroupByRecordedDay;

  @override
  Map<DateTime, RecordsSummary> get summariesGroupByRecordedDay {
    if (_didsummariesGroupByRecordedDay == false) {
      _didsummariesGroupByRecordedDay = true;
      _summariesGroupByRecordedDay = records
          .map((record) => record.recordedAt.startOfDay())
          .fold(<DateTime, RecordsSummary>{}, (map, key) {
        map[key] = RecordsSummary(
          goalCarbGram: goalCarbGram,
          records: records
              .where((record) => record.recordedAt.startOfDay() == key)
              .toList(),
        );
        return map;
      });
    }
    return _summariesGroupByRecordedDay;
  }

  bool _didsummariesGroupByRecordedMonth = false;
  Map<DateTime, RecordsSummary> _summariesGroupByRecordedMonth;

  @override
  Map<DateTime, RecordsSummary> get summariesGroupByRecordedMonth {
    if (_didsummariesGroupByRecordedMonth == false) {
      _didsummariesGroupByRecordedMonth = true;
      _summariesGroupByRecordedMonth = records
          .map((record) => record.recordedAt.startOfMonth())
          .fold(<DateTime, RecordsSummary>{}, (map, key) {
        map[key] = RecordsSummary(
          goalCarbGram: goalCarbGram,
          records: records
              .where((record) => record.recordedAt.startOfMonth() == key)
              .toList(),
        );
        return map;
      });
    }
    return _summariesGroupByRecordedMonth;
  }

  bool _didtotalCarbGram = false;
  int _totalCarbGram;

  @override
  int get totalCarbGram {
    if (_didtotalCarbGram == false) {
      _didtotalCarbGram = true;
      _totalCarbGram =
          records.map((record) => record.carbGram).fold(0, (a, b) => a + b);
    }
    return _totalCarbGram;
  }

  bool _didrecordedDays = false;
  int _recordedDays;

  @override
  int get recordedDays {
    if (_didrecordedDays == false) {
      _didrecordedDays = true;
      _recordedDays = records
          .map((record) => record.recordedAt.startOfDay())
          .toSet()
          .length;
    }
    return _recordedDays;
  }

  bool _didremainCarbGram = false;
  int _remainCarbGram;

  @override
  int get remainCarbGram {
    if (_didremainCarbGram == false) {
      _didremainCarbGram = true;
      _remainCarbGram = goalCarbGram - totalCarbGram;
    }
    return _remainCarbGram;
  }

  bool _didaverageCarbGramPerDay = false;
  int _averageCarbGramPerDay;

  @override
  int get averageCarbGramPerDay {
    if (_didaverageCarbGramPerDay == false) {
      _didaverageCarbGramPerDay = true;
      _averageCarbGramPerDay =
          records.isEmpty ? 0 : totalCarbGram ~/ recordedDays;
    }
    return _averageCarbGramPerDay;
  }

  bool _didmaxByTotalAndGoalCarbGram = false;
  int _maxByTotalAndGoalCarbGram;

  @override
  int get maxByTotalAndGoalCarbGram {
    if (_didmaxByTotalAndGoalCarbGram == false) {
      _didmaxByTotalAndGoalCarbGram = true;
      _maxByTotalAndGoalCarbGram = max(totalCarbGram, goalCarbGram);
    }
    return _maxByTotalAndGoalCarbGram;
  }

  bool _didisOverGoalCarbGram = false;
  bool _isOverGoalCarbGram;

  @override
  bool get isOverGoalCarbGram {
    if (_didisOverGoalCarbGram == false) {
      _didisOverGoalCarbGram = true;
      _isOverGoalCarbGram = totalCarbGram > goalCarbGram;
    }
    return _isOverGoalCarbGram;
  }

  bool _didachievedGoalCarbGramDays = false;
  int _achievedGoalCarbGramDays;

  @override
  int get achievedGoalCarbGramDays {
    if (_didachievedGoalCarbGramDays == false) {
      _didachievedGoalCarbGramDays = true;
      _achievedGoalCarbGramDays = summariesGroupByRecordedDay.values
          .where((summary) => summary.isOverGoalCarbGram == false)
          .length;
    }
    return _achievedGoalCarbGramDays;
  }

  @override
  String toString() {
    return 'RecordsSummary(goalCarbGram: $goalCarbGram, records: $records, summariesGroupByRecordedDay: $summariesGroupByRecordedDay, summariesGroupByRecordedMonth: $summariesGroupByRecordedMonth, totalCarbGram: $totalCarbGram, recordedDays: $recordedDays, remainCarbGram: $remainCarbGram, averageCarbGramPerDay: $averageCarbGramPerDay, maxByTotalAndGoalCarbGram: $maxByTotalAndGoalCarbGram, isOverGoalCarbGram: $isOverGoalCarbGram, achievedGoalCarbGramDays: $achievedGoalCarbGramDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecordsSummary &&
            (identical(other.goalCarbGram, goalCarbGram) ||
                const DeepCollectionEquality()
                    .equals(other.goalCarbGram, goalCarbGram)) &&
            (identical(other.records, records) ||
                const DeepCollectionEquality().equals(other.records, records)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(goalCarbGram) ^
      const DeepCollectionEquality().hash(records);

  @JsonKey(ignore: true)
  @override
  _$RecordsSummaryCopyWith<_RecordsSummary> get copyWith =>
      __$RecordsSummaryCopyWithImpl<_RecordsSummary>(this, _$identity);
}

abstract class _RecordsSummary extends RecordsSummary {
  _RecordsSummary._() : super._();
  factory _RecordsSummary(
      {@required int goalCarbGram,
      @required List<Record> records}) = _$_RecordsSummary;

  @override
  int get goalCarbGram;
  @override
  List<Record> get records;
  @override
  @JsonKey(ignore: true)
  _$RecordsSummaryCopyWith<_RecordsSummary> get copyWith;
}
