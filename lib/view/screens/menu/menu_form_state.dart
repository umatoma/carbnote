import 'dart:io';

import 'package:carbnote/models/menu_model.dart';
import 'package:carbnote/models/user_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'menu_form_state.freezed.dart';

final menuFormStateProvider = StateProvider.autoDispose((ref) {
  final user = ref.read(currentUserProvider);
  return MenuFormState(
    isProcessing: false,
    user: user,
    menu: Menu(
      userID: user.id,
      name: '',
      unit: '',
      carbGramPerUnit: 0,
      imageURL: 'https://placehold.jp/150x150.png',
    ),
  );
});

final menuFormControllerProvider = Provider.autoDispose((ref) {
  return MenuFormController(ref.read);
});

@freezed
abstract class MenuFormState with _$MenuFormState {
  factory MenuFormState({
    @required bool isProcessing,
    @nullable Object error,
    @required User user,
    @nullable File imageFile,
    @required Menu menu,
  }) = _MenuFormState;

  @late
  bool get canSubmitForm => menu.name.isNotEmpty && menu.unit.isNotEmpty;
}

class MenuFormController {
  const MenuFormController(this.read);

  final Reader read;

  MenuFormState get state => read(menuFormStateProvider).state;

  set state(MenuFormState value) => read(menuFormStateProvider).state = value;

  void setError(Object e, StackTrace stackTrace) {
    print(e);
    print(stackTrace);
    state = state.copyWith(error: e);
  }

  void setName(String value) {
    state = state.copyWith(
      menu: state.menu.copyWith(name: value),
    );
  }

  void setUnit(String value) {
    state = state.copyWith(
      menu: state.menu.copyWith(unit: value),
    );
  }

  void setCarbGramPerUnit(double value) {
    state = state.copyWith(
      menu: state.menu.copyWith(carbGramPerUnit: value),
    );
  }

  void pickImageFile() {
    ImagePicker().getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        state = state.copyWith(imageFile: File(value.path));
      }
    }).catchError(
      (Object e, StackTrace stackTrace) => setError(e, stackTrace),
    );
  }

  Future<void> submitForm() async {
    try {
      final userRepo = read(userRepoProvider);
      final myMenuRepo = read(myMenuRepoProvider);
      final menu = state.menu.copyWith(
        imageURL: state.imageFile == null
            ? state.menu.imageURL
            : await userRepo.createImage(state.user, state.imageFile),
      );
      await myMenuRepo.create(menu);

      state = state.copyWith(isProcessing: false);
      read(navKeyProvider).currentState.pop();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
      state = state.copyWith(isProcessing: false);
    }
  }
}
