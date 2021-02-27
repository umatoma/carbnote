import 'dart:async';
import 'dart:io';

import 'package:carbnote/models/menu_model.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/models/user_model.dart';
import 'package:carbnote/view/providers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'record_form_state.freezed.dart';

final recordStateProvider = StateProvider<Record>((ref) {
  return null;
});

final menuStateProvider = StateProvider<Menu>((ref) {
  return null;
});

final formStateProvider = StateProvider.autoDispose((ref) {
  final user = ref.read(currentUserProvider);
  final menu = ref.read(menuStateProvider).state;
  final record = ref.read(recordStateProvider).state;
  return RecordFormState(
    isProcessing: false,
    user: user,
    record: record ??
        Record(
          userID: user.id,
          timeType: RecordTimeType.breakfast,
          name: menu?.name ?? '',
          unit: menu?.unit ?? '1個',
          carbGramPerUnit: menu?.carbGramPerUnit ?? 0,
          recordedAt: DateTime.now(),
        ),
    menu: menu,
  );
});

final formControllerProvider = Provider.autoDispose((ref) {
  return RecordFormController(ref.read);
});

@freezed
abstract class RecordFormState with _$RecordFormState {
  factory RecordFormState({
    @required bool isProcessing,
    @nullable Object error,
    @required User user,
    @nullable File imageFile,
    @nullable Menu menu,
    @required Record record,
  }) = _RecordFormState;

  @late
  bool get canReCustomize => menu != null;

  @late
  bool get canEditName => menu == null;

  @late
  bool get canEditCarbGramPerUnit => menu == null;

  @late
  bool get canEditUnit => menu == null;

  @late
  bool get canSubmitForm => record.name.isNotEmpty && record.unit.isNotEmpty;

  @late
  bool get isUpdate => record.id != null;
}

class RecordFormController {
  const RecordFormController(this.read);

  final Reader read;

  RecordFormState get state => read(formStateProvider).state;

  set state(RecordFormState value) => read(formStateProvider).state = value;

  void setCurrentRecordAndMenu(Record record, Menu menu) {
    read(recordStateProvider).state = record;
    read(menuStateProvider).state = menu;
  }

  void unsetMenu() {
    state = state.copyWith(menu: null);
  }

  void setCarbGramPerUnit(double value) {
    state = state.copyWith(
      record: state.record.copyWith(carbGramPerUnit: value),
    );
  }

  void setUnit(String value) {
    state = state.copyWith(
      record: state.record.copyWith(unit: value),
    );
  }

  void setIntakePercent(double value) {
    state = state.copyWith(
      record: state.record.copyWith(intakePercent: value),
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

  void setRecordedAt(DateTime value) {
    state = state.copyWith(
      record: state.record.copyWith(recordedAt: value),
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

  Future<void> submitForm() async {
    state = state.copyWith(isProcessing: true);
    try {
      final userRepo = read(userRepoProvider);
      final recordRepo = read(recordRepoProvider);

      if (state.isUpdate) {
        final record = state.record.copyWith(
          imageURL: state.imageFile == null
              ? state.record.imageURL
              : await userRepo.createImage(state.user, state.imageFile),
        );
        await recordRepo.update(record);
      } else {
        final record = state.record.copyWith(
          imageURL: state.imageFile == null
              ? 'https://placehold.jp/150x150.png'
              : await userRepo.createImage(state.user, state.imageFile),
        );
        await recordRepo.create(record);
      }

      state = state.copyWith(isProcessing: false);
      read(navKeyProvider).currentState.popUntil((route) => route.isFirst);
    } catch (e, stackTrace) {
      setError(e, stackTrace);
      state = state.copyWith(isProcessing: false);
    }
  }

  Future<void> deleteRecord() async {
    state = state.copyWith(isProcessing: true);
    try {
      final recordRepo = read(recordRepoProvider);
      await recordRepo.delete(state.record);

      state = state.copyWith(isProcessing: false);
      read(navKeyProvider).currentState.popUntil((route) => route.isFirst);
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
