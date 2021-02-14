import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    @required String id,
    @nullable String email,
    @nullable String nickname,
    @nullable String imageURL,
    @required bool isAnonymous,
  }) = _AuthUser;
}
