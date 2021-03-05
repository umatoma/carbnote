import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:carbnote/libs/image_classifier.dart';
import 'package:carbnote/models/app_notification_model.dart';
import 'package:carbnote/models/menu_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:tuple/tuple.dart';

final notificationStateProvider =
    StateProvider.autoDispose<AppNotification>((ref) {
  return null;
});

final textEditingControllerProvider = Provider.autoDispose((ref) {
  final controller = TextEditingController(text: '');
  ref.onDispose(() => controller.dispose());
  return controller;
});

final inputStreamControllerProvider = Provider.autoDispose((ref) {
  return StreamController<String>();
});

final menusStreamProvider = StreamProvider.autoDispose((ref) {
  final menuRepo = ref.read(menuRepoProvider);
  return ref
      .watch(inputStreamControllerProvider)
      .stream
      .debounce(const Duration(seconds: 1))
      .map((intput) => intput.trim().split(' '))
      .map((input) => input.where((i) => i.isNotEmpty).toList())
      .asyncMap(
        (input) => input.isEmpty
            ? Future.value(<Menu>[])
            : menuRepo.searchListByNames(input),
      );
});

final menusControllerProvider = Provider.autoDispose((ref) {
  return MenusController(ref.read);
});

final myMenusStreamProvider = StreamProvider.autoDispose((ref) {
  final myMenuRepo = ref.read(myMenuRepoProvider);
  final user = ref.read(currentUserProvider);
  return myMenuRepo.getList(user.id);
});

class MenusController {
  MenusController(this.read);

  final Reader read;
  Uint8List model;
  List<String> labels;

  static Future<Map<String, double>> predict(
    Tuple3<Uint8List, List<String>, String> data,
  ) async {
    final classifier = FloatImageClassifier();
    await classifier.load(model: data.item1, labels: data.item2);
    final result = classifier.predict(File(data.item3));
    classifier.close();
    return result;
  }

  void setInput(String value) {
    read(inputStreamControllerProvider).sink.add(value);
  }

  Future<void> pickAndEstimateImage() async {
    try {
      final file = await ImagePicker().getImage(source: ImageSource.gallery);
      if (file != null) {
        model ??= (await rootBundle.load('assets/models/model.tflite'))
            .buffer
            .asUint8List();
        labels ??= (await rootBundle.loadString('assets/models/labels.txt'))
            .split('\n');
        final result = await compute(predict, Tuple3(model, labels, file.path));
        final names = <String>[];
        for (final entry in result.entries) {
          final name = utf8.decode(base64Url.decode(entry.key));
          final value = entry.value;
          if (value > 0.3) {
            names.add(name);
            print('$name:$value');
          }
        }
        if (names.isEmpty) {
          read(notificationStateProvider).state = const AppNotification(
            type: AppNotificationType.warning,
            message: '画像を識別できませんでした。。。',
          );
        } else {
          final namesString = names.join(' ');
          read(textEditingControllerProvider).text = namesString;
          read(inputStreamControllerProvider).sink.add(namesString);
          read(notificationStateProvider).state = const AppNotification(
            type: AppNotificationType.info,
            message: '画像を識別しました！',
          );
        }
      }
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }
}
