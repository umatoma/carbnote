import 'package:carbnote/models/app_notification_model.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<void> showAppNotification({
  @required BuildContext context,
  @required AppNotification notification,
}) async {
  Color backgroundColor;
  Color textColor;
  switch (notification.type) {
    case AppNotificationType.warning:
      backgroundColor = Colors.red;
      textColor = Colors.white;
      break;
    case AppNotificationType.info:
    default:
      backgroundColor = Theme.of(context).primaryColorDark;
      textColor = Colors.white;
      break;
  }

  await showFlash<void>(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (context, controller) {
      return Flash<void>(
        controller: controller,
        backgroundColor: backgroundColor,
        position: FlashPosition.top,
        child: FlashBar(
          message: Text(
            notification.message,
            style: TextStyle(color: textColor),
          ),
        ),
      );
    },
  );
}
