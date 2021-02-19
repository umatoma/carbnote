import 'dart:io';

import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/models/user_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'record_form_state.freezed.dart';

final currentRecordProvider = ScopedProvider<Record>((ref) {
  return null;
});

final recordFormStateProvider = StateNotifierProvider.autoDispose
    .family<RecordFormStateController, Record>((ref, record) {
  return RecordFormStateController(
    ref.read,
    record: record,
  );
});

@freezed
abstract class RecordFormState with _$RecordFormState {
  factory RecordFormState({
    @required bool isProcessing,
    @nullable Object error,
    @required User user,
    @nullable File imageFile,
    @required Record record,
  }) = _RecordFormState;

  @late
  bool get canSubmitForm => record.name.isNotEmpty;
}

class RecordFormStateController extends StateNotifier<RecordFormState> {
  RecordFormStateController(
    this.read, {
    Record record,
  }) : super(RecordFormState(
          isProcessing: true,
          user: read(currentUserProvider),
          record: record ??
              Record(
                userID: read(currentUserProvider).id,
                timeType: RecordTimeType.breakfast,
                name: '',
                imageURL: 'https://placehold.jp/150x150.png',
                carbGram: 0,
                note: '',
                recordedAt: DateTime.now(),
              ),
        )) {
    () async {
      if (state.record.id == null) {
        state = state.copyWith(isProcessing: false);
      } else {
        state = state.copyWith(
            isProcessing: false,
            record: await read(recordRepoProvider).getOne(
              state.record.id,
              state.user.id,
            ));
      }
    }();
  }

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

  void setName(String value) {
    state = state.copyWith(
      record: state.record.copyWith(name: value),
    );
  }

  void setNote(String value) {
    state = state.copyWith(
      record: state.record.copyWith(note: value),
    );
  }

  void setTimeType(RecordTimeType value) {
    state = state.copyWith(
      record: state.record.copyWith(timeType: value),
    );
  }

  void setCarbGram(int value) {
    state = state.copyWith(
      record: state.record.copyWith(carbGram: value),
    );
  }

  Future<void> submitForm() async {
    state = state.copyWith(isProcessing: true);
    try {
      final userRepo = read(userRepoProvider);
      final recordRepo = read(recordRepoProvider);

      final imageURL = state.imageFile == null
          ? null
          : await userRepo.createImage(state.user, state.imageFile);
      final record = imageURL == null
          ? state.record
          : state.record.copyWith(imageURL: imageURL);
      if (record.id == null) {
        await recordRepo.create(record);
      } else {
        await recordRepo.update(record);
      }

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
