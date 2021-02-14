import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  factory Profile({
    @required String id,
    @required int goalCarbGram,
    @nullable DateTime createdAt,
    @nullable DateTime updatedAt,
  }) = _Profile;
}
