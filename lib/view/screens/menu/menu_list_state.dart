import 'dart:async';

import 'package:carbnote/models/menu_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stream_transform/stream_transform.dart';

final inputStreamControllerProvider = Provider.autoDispose((ref) {
  return StreamController<String>();
});

final menusStreamProvider = StreamProvider.autoDispose((ref) {
  final menuRepo = ref.read(menuRepoProvider);
  return ref
      .watch(inputStreamControllerProvider)
      .stream
      .debounce(const Duration(seconds: 1))
      .map((intput) => intput.trim())
      .asyncMap(
        (input) => input.isEmpty
            ? Future.value(<Menu>[])
            : menuRepo.searchListByName(input),
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
  const MenusController(this.read);

  final Reader read;

  void setInput(String value) {
    read(inputStreamControllerProvider).sink.add(value);
  }
}
