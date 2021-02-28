import 'dart:math';

import 'package:carbnote/models/date_time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.freezed.dart';

enum RecordTimeType {
  breakfast,
  lunch,
  dinner,
  snack,
}

RecordTimeType estimateTimeType(DateTime dateTime) {
  if ([5, 6, 7, 8, 9, 10].contains(dateTime.hour)) {
    return RecordTimeType.breakfast;
  }
  if ([11, 12, 13, 14].contains(dateTime.hour)) {
    return RecordTimeType.lunch;
  }
  if ([18, 19, 20, 21, 22].contains(dateTime.hour)) {
    return RecordTimeType.dinner;
  }
  return RecordTimeType.snack;
}

@freezed
abstract class Record with _$Record {
  factory Record({
    @nullable String id,
    @required String userID,
    @Default(RecordTimeType.breakfast) RecordTimeType timeType,
    @Default('') String name,
    @Default('') String note,
    @nullable String imageURL,
    @Default('') String unit,
    @Default(0) double carbGramPerUnit,
    @Default(1.0) double intakePercent,
    @required DateTime recordedAt,
    @nullable DateTime updatedAt,
    @nullable DateTime createdAt,
  }) = _Record;

  Record._();

  @late
  int get carbGram => (carbGramPerUnit * intakePercent).round();

  bool getIsOverGoalCarbGram(int goalCarbGram) {
    return goalCarbGram > goalCarbGram;
  }
}

@freezed
abstract class RecordsSummary implements _$RecordsSummary {
  factory RecordsSummary({
    @required int goalCarbGram,
    @required List<Record> records,
  }) = _RecordsSummary;

  RecordsSummary._();

  @late
  Map<DateTime, RecordsSummary> get summariesGroupByRecordedDay => records
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

  @late
  Map<DateTime, RecordsSummary> get summariesGroupByRecordedMonth => records
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

  @late
  int get totalCarbGram =>
      records.map((record) => record.carbGram).fold(0, (a, b) => a + b);

  @late
  int get recordedDays =>
      records.map((record) => record.recordedAt.startOfDay()).toSet().length;

  @late
  int get remainCarbGram => goalCarbGram - totalCarbGram;

  @late
  int get averageCarbGramPerDay =>
      records.isEmpty ? 0 : totalCarbGram ~/ recordedDays;

  @late
  int get maxByTotalAndGoalCarbGram => max(totalCarbGram, goalCarbGram);

  @late
  bool get isOverGoalCarbGram => totalCarbGram > goalCarbGram;

  @late
  int get achievedGoalCarbGramDays => summariesGroupByRecordedDay.values
      .where((summary) => summary.isOverGoalCarbGram == false)
      .length;

  int getTotalCarbGramByTimeType(RecordTimeType timeType) {
    return records
        .where((record) => record.timeType == timeType)
        .map((record) => record.carbGram)
        .fold(0, (a, b) => a + b);
  }
}
