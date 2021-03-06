import 'dart:io';

import 'package:carbnote/models/user_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'user_edit_state.freezed.dart';

final userEditStateProvider = StateNotifierProvider.autoDispose((ref) {
  return UserEditStateNotifier(ref.read);
});

@freezed
abstract class UserEditState with _$UserEditState {
  factory UserEditState({
    @required bool isProcessing,
    @nullable Object error,
    @required User user,
    @nullable File imageFile,
  }) = _UserEditState;
}

class UserEditStateNotifier extends StateNotifier<UserEditState> {
  UserEditStateNotifier(this.read)
      : super(UserEditState(
          isProcessing: false,
          user: read(currentUserProvider),
        ));

  final Reader read;

  void pickImageFile() {
    ImagePicker().getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        state = state.copyWith(imageFile: File(value.path));
      }
    }).catchError(
      (Object e, StackTrace stackTrace) => setError(e, stackTrace),
    );
  }

  void setNickname(String value) {
    state = state.copyWith(
      user: state.user.copyWith(nickname: value),
    );
  }

  void setGoalCarbGram(int value) {
    state = state.copyWith(
      user: state.user.copyWith(goalCarbGram: value),
    );
  }

  Future<void> submitForm() async {
    state = state.copyWith(isProcessing: true);
    try {
      final userRepo = read(userRepoProvider);
      final imageURL = state.imageFile == null
          ? state.user.imageURL
          : await userRepo.createImage(state.user, state.imageFile);
      final user = state.user.copyWith(imageURL: imageURL);
      await userRepo.update(user);

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
