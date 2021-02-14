import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';

part 'sign_in_state.freezed.dart';

final signInStateProvider = StateNotifierProvider.autoDispose((ref) {
  return SignInStateNotifier(ref.read);
});

@freezed
abstract class SignInState with _$SignInState {
  factory SignInState({
    @required bool isProcessing,
    @nullable Object error,
    @required String email,
    @required String password,
  }) = _SignInState;

  @late
  bool get canSignIn => email.isNotEmpty && password.isNotEmpty;

  @late
  bool get canResetPassword => email.isNotEmpty;
}

class SignInStateNotifier extends StateNotifier<SignInState> {
  SignInStateNotifier(this.read)
      : super(SignInState(
          isProcessing: false,
          email: '',
          password: '',
        ));

  final Reader read;

  void setEmail(String value) {
    state = state.copyWith(email: value);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> signIn() async {
    state = state.copyWith(isProcessing: true);
    try {
      await read(authRepoProvider).signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      final navKey = read(navKeyProvider);
      await Navigator.of(navKey.currentState.context).pushAndRemoveUntil(
        CupertinoPageRoute<void>(
          builder: (_) => const HomeScreen(),
          fullscreenDialog: true,
        ),
        (route) => false,
      );
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      state = state.copyWith(
        error: e,
        isProcessing: false,
      );
    }
  }

  Future<void> resetPassword() async {
    state = state.copyWith(isProcessing: true);
    try {
      await read(authRepoProvider).sendPasswordResetEmail(state.email);
      state = state.copyWith(isProcessing: false);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      state = state.copyWith(
        error: e,
        isProcessing: false,
      );
    }
  }
}
