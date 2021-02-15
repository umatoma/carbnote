import 'dart:io';

import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_edit_state.freezed.dart';

final profileEditStateProvider = StateNotifierProvider.autoDispose((ref) {
  return ProfileEditStateNotifier(ref.read);
});

@freezed
abstract class ProfileEditForm with _$ProfileEditForm {
  factory ProfileEditForm({
    @required String nickname,
    @required String imageURL,
    @nullable File imageFile,
  }) = _ProfileEditForm;
}

@freezed
abstract class ProfileEditState with _$ProfileEditState {
  factory ProfileEditState({
    @required bool isProcessing,
    @nullable Object error,
    @required ProfileEditForm form,
  }) = _ProfileEditState;
}

class ProfileEditStateNotifier extends StateNotifier<ProfileEditState> {
  ProfileEditStateNotifier(this.read)
      : super(ProfileEditState(
          isProcessing: false,
          form: ProfileEditForm(
            nickname: read(currentUserProvider).nickname,
            imageURL: read(currentUserProvider).imageURL,
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

  Future<void> submitForm() async {
    state = state.copyWith(isProcessing: true);
    try {
      final user = read(currentUserProvider);
      final authRepo = read(authRepoProvider);
      final imageURL = state.form.imageFile == null
          ? state.form.imageURL
          : await authRepo.uploadUserImage(
              userID: user.id,
              file: state.form.imageFile,
            );
      await authRepo.updateCurrentUser(
        nickname: state.form.nickname,
        imageURL: imageURL,
      );
      final navKey = read(navKeyProvider);
      state = state.copyWith(isProcessing: false);
      Navigator.of(navKey.currentState.context).pop();
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
