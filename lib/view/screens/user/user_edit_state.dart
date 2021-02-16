import 'dart:io';

import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:image_picker/image_picker.dart';

part 'user_edit_state.freezed.dart';

final userEditStateProvider = StateNotifierProvider.autoDispose((ref) {
  return UserEditStateNotifier(ref.read);
});

@freezed
abstract class UserEditForm with _$UserEditForm {
  factory UserEditForm({
    @required String nickname,
    @required String imageURL,
    @nullable File imageFile,
    @required int goalCarbGram,
  }) = _UserEditForm;
}

@freezed
abstract class UserEditState with _$UserEditState {
  factory UserEditState({
    @required bool isProcessing,
    @nullable Object error,
    @required UserEditForm form,
  }) = _UserEditState;
}

class UserEditStateNotifier extends StateNotifier<UserEditState> {
  UserEditStateNotifier(this.read)
      : super(UserEditState(
          isProcessing: false,
          form: UserEditForm(
            nickname: read(currentUserProvider).nickname,
            imageURL: read(currentUserProvider).imageURL,
            goalCarbGram: read(currentUserProvider).goalCarbGram,
          ),
        ));

  final Reader read;

  void pickImageFile() {
    ImagePicker().getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        state = state.copyWith(
          form: state.form.copyWith(imageFile: File(value.path)),
        );
      }
    }).catchError(
      (Object e, StackTrace stackTrace) => setError(e, stackTrace),
    );
  }

  void setNickname(String value) {
    state = state.copyWith(
      form: state.form.copyWith(nickname: value),
    );
  }

  void setGoalCarbGram(int value) {
    state = state.copyWith(
      form: state.form.copyWith(goalCarbGram: value),
    );
  }

  Future<void> submitForm() async {
    state = state.copyWith(isProcessing: true);
    try {
      final userRepo = read(userRepoProvider);
      final user = read(currentUserProvider);

      final imageURL = state.form.imageFile == null
          ? state.form.imageURL
          : await userRepo.createImage(user, state.form.imageFile);
      await userRepo.update(user.copyWith(
        nickname: state.form.nickname,
        imageURL: imageURL,
      ));

      state = state.copyWith(isProcessing: false);
      read(navKeyProvider).currentState.pop();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
      state = state.copyWith(isProcessing: false);
    }
  }

  void setError(Object e, StackTrace stackTrace) {
    print(e);
    print(stackTrace);
    state = state.copyWith(error: e);
  }
}
