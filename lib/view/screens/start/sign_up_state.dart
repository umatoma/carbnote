// ignore_for_file: top_level_function_literal_block
import 'dart:io';

import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/start/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_state.freezed.dart';

final signUpStateProvider = StateNotifierProvider.autoDispose((ref) {
  return SignUpStateNotifier(ref.read);
});

@freezed
abstract class SignUpForm with _$SignUpForm {
  factory SignUpForm({
    @required int goalCarbGram,
    @nullable File imageFile,
    @required String nickname,
    @required String email,
    @required String password,
  }) = _SignUpForm;
}

@freezed
abstract class SignUpState with _$SignUpState {
  factory SignUpState({
    @required bool isProcessing,
    @nullable Object error,
    @required int page,
    @required int itemCount,
    @required PageController controller,
    @required SignUpForm form,
  }) = _SignUpState;

  @late
  bool get canSubmitProfile => form.nickname.isNotEmpty;

  @late
  bool get canSubmitSignInSetting =>
      form.email.isNotEmpty &&
      form.email.contains('@') &&
      form.password.isNotEmpty;
}

class SignUpStateNotifier extends StateNotifier<SignUpState> {
  SignUpStateNotifier(this.read)
      : super(SignUpState(
          isProcessing: false,
          page: 0,
          itemCount: 1,
          controller: PageController(),
          form: SignUpForm(
            goalCarbGram: 100,
            nickname: '',
            email: '',
            password: '',
          ),
        ));

  final Reader read;
  final Duration duration = const Duration(milliseconds: 300);
  final Curve curve = Curves.easeInOut;

  @override
  void dispose() {
    state.controller.dispose();
    super.dispose();
  }

  void setError(Object e, StackTrace stackTrace) {
    print(e);
    print(stackTrace);
    state = state.copyWith(error: e);
  }

  void prevPage() {
    state.controller
        .previousPage(duration: duration, curve: curve)
        .then((_) => syncPage());
  }

  void nextPage() {
    state.controller
        .nextPage(duration: duration, curve: curve)
        .then((_) => syncPage());
  }

  void syncPage() {
    state = state.copyWith(page: state.controller.page.toInt());
  }

  void setGoalCarbGram(int value) {
    state = state.copyWith(
      form: state.form.copyWith(goalCarbGram: value),
    );
  }

  void submitGoal() {
    state = state.copyWith(itemCount: 2);
    nextPage();
  }

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
      form: state.form.copyWith(nickname: value.trim()),
    );
  }

  void submitProfile() {
    state = state.copyWith(itemCount: 3);
    nextPage();
  }

  void setEmail(String value) {
    state = state.copyWith(
      form: state.form.copyWith(email: value.trim()),
    );
  }

  void setPassword(String value) {
    state = state.copyWith(
      form: state.form.copyWith(password: value),
    );
  }

  Future<void> sumbitSignInSetting({bool skip = false}) async {
    state = state.copyWith(isProcessing: true);
    try {
      final authRepo = read(authRepoProvider);
      final authUser = skip
          ? await authRepo.signInAnonymously()
          : await authRepo.signUpWithEmailAndPassword(
              email: state.form.email,
              password: state.form.password,
            );
      final imageURL = state.form.imageFile == null
          ? 'https://placehold.jp/150x150.png'
          : await authRepo.uploadUserImage(
              userID: authUser.id,
              file: state.form.imageFile,
            );
      await authRepo.updateCurrentUser(
        nickname: state.form.nickname,
        imageURL: imageURL,
      );

      final navKey = read(navKeyProvider);
      await Navigator.of(navKey.currentState.context).pushAndRemoveUntil(
        CupertinoPageRoute<void>(
          builder: (_) => const WelcomeScreen(),
          fullscreenDialog: true,
        ),
        (route) => false,
      );
    } catch (e, stackTrace) {
      setError(e, stackTrace);
      state = state.copyWith(isProcessing: false);
    }
  }
}
