import 'dart:io';

import 'package:carbnote/models/auth_user_model.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/models/user_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:image_picker/image_picker.dart';

part 'record_create_state.freezed.dart';

final recordCreateStateProvider = StateNotifierProvider.autoDispose((ref) {
  return RecordCreateStateNotifier(ref.read);
});

@freezed
abstract class RecordCreateForm with _$RecordCreateForm {
  factory RecordCreateForm({
    @required RecordTimeType timeType,
    @required String name,
    @nullable File imageFile,
    @required int intakeGram,
    @required int carbGram,
    @required DateTime recordedAt,
  }) = _RecordCreateForm;
}

@freezed
abstract class RecordCreateState with _$RecordCreateState {
  factory RecordCreateState({
    @required bool isProcessing,
    @nullable Object error,
    @required RecordCreateForm form,
    @required User user,
  }) = _RecordCreateState;

  @late
  bool get canSubmitForm => form.name.isNotEmpty;
}

class RecordCreateStateNotifier extends StateNotifier<RecordCreateState> {
  RecordCreateStateNotifier(this.read)
      : super(RecordCreateState(
          isProcessing: false,
          form: RecordCreateForm(
            timeType: RecordTimeType.breakfast,
            name: '',
            intakeGram: 0,
            carbGram: 0,
            recordedAt: DateTime.now(),
          ),
          user: read(currentUserProvider),
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

  void setName(String value) {
    state = state.copyWith(
      form: state.form.copyWith(name: value),
    );
  }

  void setTimeType(RecordTimeType value) {
    state = state.copyWith(
      form: state.form.copyWith(timeType: value),
    );
  }

  void setIntakeGram(int value) {
    state = state.copyWith(
      form: state.form.copyWith(intakeGram: value),
    );
  }

  void setCarbGram(int value) {
    state = state.copyWith(
      form: state.form.copyWith(carbGram: value),
    );
  }

  Future<void> submitForm() async {
    state = state.copyWith(isProcessing: true);
    try {
      final userRepo = read(userRepoProvider);
      final recordRepo = read(recordRepoProvider);

      final imageURL = state.form.imageFile == null
          ? 'https://placehold.jp/150x150.png'
          : await userRepo.createImage(state.user, state.form.imageFile);
      final record = Record(
        userID: state.user.id,
        timeType: state.form.timeType,
        name: state.form.name,
        imageURL: imageURL,
        intakeGram: state.form.intakeGram,
        carbGram: state.form.carbGram,
        recordedAt: state.form.recordedAt,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );
      await recordRepo.create(record);

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
