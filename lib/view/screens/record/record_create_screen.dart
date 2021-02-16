import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/screens/record/record_create_state.dart';
import 'package:carbnote/view/strings.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:intl/intl.dart';

class RecordCreateScreen extends HookWidget {
  const RecordCreateScreen() : super();

  @override
  Widget build(BuildContext context) {
    const timeTypes = RecordTimeType.values;
    final state = useProvider(recordCreateStateProvider.state);

    return CnProgressContainer(
      isProgressing: state.isProcessing,
      child: CnScaffold(
        appBar: CnNavBar(
          leading: CnNavButton.close(
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            DateFormat('MM月dd日').format(state.form.recordedAt),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Hero(
                tag: 'RecordImage',
                child: CnImageField(
                  onPressed: () =>
                      context.read(recordCreateStateProvider).pickImageFile(),
                  icon: CupertinoIcons.photo,
                  image: state.form.imageFile == null
                      ? null
                      : Image.file(state.form.imageFile),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnTextField(
                onChanged: (value) =>
                    context.read(recordCreateStateProvider).setName(value),
                initialValue: state.form.name,
                hintText: '名前',
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
                        '食べた量',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: CnGramField(
                      onChanged: (value) => context
                          .read(recordCreateStateProvider)
                          .setIntakeGram(value),
                      gram: state.form.intakeGram,
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
                          .read(recordCreateStateProvider)
                          .setCarbGram(value),
                      gram: state.form.carbGram,
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
                            .read(recordCreateStateProvider)
                            .setTimeType(type),
                        selected: type == state.form.timeType,
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
                      ? () =>
                          context.read(recordCreateStateProvider).submitForm()
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
