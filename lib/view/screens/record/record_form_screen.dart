import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/screens/record/record_form_state.dart';
import 'package:carbnote/view/strings.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RecordFormScreen extends HookWidget {
  const RecordFormScreen() : super();

  @override
  Widget build(BuildContext context) {
    const timeTypes = RecordTimeType.values;
    final currentRecord = useProvider(currentRecordProvider);
    final state = useProvider(recordFormStateProvider(currentRecord).state);

    return CnProgressContainer(
      isProgressing: state.isProcessing,
      child: CnScaffold(
        appBar: CnNavBar(
          leading: CnNavButton.close(
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            DateFormat('MM月dd日').format(state.record.recordedAt),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Hero(
                tag: 'RecordImage_${state.record.id}',
                child: CnImageField.fileOrURL(
                  onPressed: () => context
                      .read(recordFormStateProvider(currentRecord))
                      .pickImageFile(),
                  icon: CupertinoIcons.photo,
                  imageURL: state.record.imageURL,
                  imageFile: state.imageFile,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnTextField(
                onChanged: (value) => context
                    .read(recordFormStateProvider(currentRecord))
                    .setName(value),
                initialValue: state.record.name,
                hintText: '名前',
                prefixIcon: CupertinoIcons.pencil,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnTextField(
                onChanged: (value) => context
                    .read(recordFormStateProvider(currentRecord))
                    .setNote(value),
                initialValue: state.record.note,
                hintText: 'メモ',
                prefixIcon: CupertinoIcons.pencil,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        '糖質',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: CnGramField(
                      onChanged: (value) => context
                          .read(recordFormStateProvider(currentRecord))
                          .setCarbGram(value),
                      gram: state.record.carbGram,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  for (final type in timeTypes) ...[
                    Expanded(
                      child: CnSecondaryButton(
                        onPressed: () => context
                            .read(recordFormStateProvider(currentRecord))
                            .setTimeType(type),
                        selected: type == state.record.timeType,
                        child: Text(CnStr.recordTimeType(type)),
                      ),
                    ),
                    if (type != timeTypes.last) const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
            if (state.error != null) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  state.error.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .apply(color: Colors.red),
                ),
              ),
            ],
            const Spacer(),
            CnBottomButtonsContainer(
              children: [
                CnPrimaryButton(
                  onPressed: state.canSubmitForm
                      ? () => context
                          .read(recordFormStateProvider(currentRecord))
                          .submitForm()
                      : null,
                  child: const Text('登録'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
