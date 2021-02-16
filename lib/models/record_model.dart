import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.freezed.dart';

enum RecordTimeType {
  breakfast,
  lunch,
  dinner,
  snack,
}

@freezed
abstract class Record with _$Record {
  const factory Record({
    @nullable String id,
    @required String userID,
    @required RecordTimeType timeType,
    @required String name,
    @required String imageURL,
    @required int intakeGram,
    @required int carbGram,
    @required DateTime recordedAt,
    @required DateTime updatedAt,
    @required DateTime createdAt,
  }) = _Record;
}
