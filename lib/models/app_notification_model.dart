import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification_model.freezed.dart';

enum AppNotificationType {
  info,
  warning,
}

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    @required AppNotificationType type,
    @required String message,
  }) = _AppNotification;
}
