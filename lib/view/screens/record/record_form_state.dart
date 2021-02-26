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
import 'package:stream_transform/stream_transform.dart';

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

final searchControllerProvider = Provider.autoDispose((ref) {
  return StreamController<String>();
});

final menusProvider = StreamProvider.autoDispose((ref) {
  final menuRepo = ref.read(menuRepoProvider);
  return ref
      .watch(searchControllerProvider)
      .stream
      .debounce(const Duration(seconds: 1))
      .map((intput) => intput.trim())
      .asyncMap(
        (input) => input.isEmpty
            ? Future.value(<Menu>[])
            : menuRepo.searchListByName(input),
      );
});

@freezed
abstract class RecordFormState with _$RecordFormState {
  factory RecordFormState({
    @required bool isProcessing,
    @required bool isSearching,
    @nullable Object error,
    @required User user,
    @nullable File imageFile,
    @nullable Menu menu,
    @required Record record,
  }) = _RecordFormState;

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

class RecordFormStateController extends StateNotifier<RecordFormState> {
  RecordFormStateController(
    this.read, {
    Record record,
  }) : super(RecordFormState(
          isProcessing: false,
          isSearching: false,
          user: read(currentUserProvider),
          record: record ??
              Record(
                userID: read(currentUserProvider).id,
                timeType: RecordTimeType.breakfast,
                unit: '1個',
                recordedAt: DateTime.now(),
              ),
        )) {
    () async {
      if (state.record.id != null) {
        state = state.copyWith(
          record: await read(recordRepoProvider).getOne(
            state.record.id,
            state.user.id,
          ),
        );
      }
    }();
  }

  final Reader read;

  void setIsSearching(bool value) {
    state = state.copyWith(isSearching: value);
  }

  void setMenu(Menu value) {
    state = state.copyWith(
      menu: value,
      record: state.record.copyWith(
        name: value.name,
        unit: value.unit,
        carbGramPerUnit: value.carbGramPerUnit,
      ),
    );
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
      read(navKeyProvider).currentState.pop();
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
