import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @nullable String id,
    @nullable String nickname,
    @nullable String imageURL,
    @required int goalCarbGram,
    @required bool isAnonymous,
    @required DateTime updatedAt,
    @required DateTime createdAt,
  }) = _User;
}
