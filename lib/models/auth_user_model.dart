import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    @required String id,
    @nullable String email,
    @required bool isAnonymous,
  }) = _AuthUser;
}
