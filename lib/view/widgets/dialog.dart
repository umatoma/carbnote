import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showCnConfirmDialog({
  @required BuildContext context,
  @required Widget title,
  Widget content,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('いいえ'),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('はい'),
          ),
        ],
      );
    },
  );
  return result ?? false;
}
