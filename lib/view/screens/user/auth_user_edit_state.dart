import 'package:carbnote/models/auth_user_model.dart';
import 'package:carbnote/models/user_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'auth_user_edit_state.freezed.dart';

final authUserEditStateProvider = StateNotifierProvider.autoDispose((ref) {
  return AuthUserEditStateNotifier(ref.read);
});

@freezed
abstract class AuthUserEditForm with _$AuthUserEditForm {
  factory AuthUserEditForm({
    @required String email,
    @required String password,
  }) = _AuthUserEditForm;
}

@freezed
abstract class AuthUserEditState with _$AuthUserEditState {
  factory AuthUserEditState({
    @required bool isProcessing,
    @nullable Object error,
    @required AuthUserEditForm form,
    @required AuthUser authUser,
  }) = _AuthUserEditState;

  @late
  bool get canSubmitForm =>
      form.email.contains('@') && form.password.isNotEmpty;
}

class AuthUserEditStateNotifier extends StateNotifier<AuthUserEditState> {
  AuthUserEditStateNotifier(this.read)
      : super(AuthUserEditState(
          isProcessing: false,
          form: AuthUserEditForm(
            email: '',
            password: '',
          ),
          authUser: read(authUserProvider),
        ));

  final Reader read;

  void setEmail(String value) {
    state = state.copyWith(
      form: state.form.copyWith(email: value),
    );
  }

  void setPassword(String value) {
    state = state.copyWith(
      form: state.form.copyWith(password: value),
    );
  }

  Future<void> submitForm() async {
    state = state.copyWith(isProcessing: true);
    try {
      final authRepo = read(authUserRepoProvider);
      if (state.authUser.isAnonymous) {
        await authRepo.linkWithEmailAndPassword(
          email: state.form.email,
          password: state.form.password,
        );
      } else {
        await authRepo.updateEmail(
          newEmail: state.form.email,
          email: state.authUser.email,
          password: state.form.password,
        );
      }

      state = state.copyWith(isProcessing: false);
      read(navKeyProvider).currentState.pop();
    } catch (e, stackTrace) {
      setError(e, stackTrace);
      state = state.copyWith(isProcessing: false);
    }
  }

  Future<void> sendPasswordResetEmail() async {
    state = state.copyWith(isProcessing: true);
    try {
      final authRepo = read(authUserRepoProvider);
      await authRepo.sendPasswordResetEmail(state.authUser.email);
      state = state.copyWith(isProcessing: false);
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
