import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/screens/record/record_form_state.dart';
import 'package:carbnote/view/strings.dart';
import 'package:carbnote/view/widgets/animation.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/dialog.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/list_tile.dart';
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
    final _record = useProvider(currentRecordProvider);
    final isProcessing = useProvider(recordFormStateProvider(_record)
        .state
        .select((state) => state.isProcessing));
    final isSearching = useProvider(recordFormStateProvider(_record)
        .state
        .select((state) => state.isSearching));

    return CnProgressContainer(
      isProgressing: isProcessing,
      child: CnScaffold(
        appBar: CnNavBar(
          leading: CnScaleSwitcher(
            child: isSearching
                ? CnNavButton.back(
                    key: const ValueKey('back'),
                    onPressed: () => context
                        .read(recordFormStateProvider(_record))
                        .setIsSearching(false),
                  )
                : CnNavButton.close(
                    key: const ValueKey('close'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
          ),
          middle: CnScaleSwitcher(
            child: isSearching
                ? const Text(
                    '検索',
                    key: ValueKey('検索'),
                  )
                : const Text(
                    '記録',
                    key: ValueKey('記録'),
                  ),
          ),
          trailing: CnScaleSwitcher(
            child: isSearching
                ? const SizedBox(
                    key: ValueKey('empty'),
                  )
                : CnNavButton.search(
                    key: const ValueKey('search'),
                    onPressed: () => context
                        .read(recordFormStateProvider(_record))
                        .setIsSearching(true),
                  ),
          ),
        ),
        body: CnFadeSwitcher(
          child: isSearching
              ? const MenuSearch(
                  key: ValueKey('FoodSearch'),
                )
              : Stack(
                  key: const ValueKey('RecordFormBody'),
                  children: const [
                    RecordFormBody(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RecordFromBottomButtons(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class MenuSearch extends HookWidget {
  const MenuSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _record = useProvider(currentRecordProvider);
    final asyncMenus = useProvider(menusProvider);

    return WillPopScope(
      onWillPop: () async {
        context.read(recordFormStateProvider(_record)).setIsSearching(false);
        return false;
      },
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CnTextField(
              onChanged: (value) =>
                  context.read(searchControllerProvider).sink.add(value),
              initialValue: '',
              hintText: '検索',
              autofocus: true,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: asyncMenus.maybeWhen(
              error: (e, stackTrace) {
                print(e);
                print(stackTrace);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  child: Center(
                    child: Text(e.toString()),
                  ),
                );
              },
              orElse: () {
                final menus = asyncMenus.data?.value ?? [];
                return ListView(
                  children: [
                    for (final menu in menus) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: CnListTile(
                          onTap: () {
                            context
                                .read(recordFormStateProvider(_record))
                                .setMenu(menu);
                            context
                                .read(recordFormStateProvider(_record))
                                .setIsSearching(false);
                          },
                          title: Text(menu.name),
                          subtitle: Text(menu.unit),
                          trailing: SizedBox(
                            width: 64,
                            child: Column(
                              children: [
                                Text(
                                  '${NumberFormat('##0.0').format(menu.carbGramPerUnit)}g',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text(
                                  '糖質',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecordFormBody extends HookWidget {
  const RecordFormBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const timeTypes = RecordTimeType.values;
    final _record = useProvider(currentRecordProvider);
    final state = useProvider(recordFormStateProvider(_record).state);

    return ListView(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              Hero(
                tag: 'RecordImage_${state.record.id}',
                child: Center(
                  child: CnImageField.fileOrURL(
                    onPressed: () => context
                        .read(recordFormStateProvider(_record))
                        .pickImageFile(),
                    icon: CupertinoIcons.photo,
                    imageURL: state.record.imageURL,
                    imageFile: state.imageFile,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '糖質',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .apply(color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${state.record.carbGram}g',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .apply(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    Text(
                      '${state.record.unit} (x${NumberFormat('#0.0').format(state.record.intakePercent)})',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('名前'),
              const SizedBox(height: 8),
              CnTextField(
                onChanged: (value) => context
                    .read(recordFormStateProvider(_record))
                    .setName(value),
                initialValue: state.record.name,
                readOnly: state.canEditName == false,
                hintText: '名前',
                prefixIcon: CupertinoIcons.pencil,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('糖質'),
              const SizedBox(height: 8),
              CnSlider(
                onChanged: (value) => context
                    .read(recordFormStateProvider(_record))
                    .setCarbGramPerUnit(value),
                value: state.record.carbGramPerUnit,
                label:
                    '${NumberFormat('##0.0').format(state.record.carbGramPerUnit)}g',
                readOnly: state.canEditCarbGramPerUnit == false,
                min: 0.0,
                max: 200.0,
                divisions: 200.0 ~/ 0.5,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('単位'),
              const SizedBox(height: 8),
              CnTextField(
                onChanged: (value) => context
                    .read(recordFormStateProvider(_record))
                    .setUnit(value),
                readOnly: state.canEditUnit == false,
                initialValue: state.record.unit,
                hintText: '1個',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('食べた量'),
              SizedBox(
                width: double.infinity,
                child: CnSlider(
                  onChanged: (value) => context
                      .read(recordFormStateProvider(_record))
                      .setIntakePercent(value),
                  value: state.record.intakePercent,
                  label:
                      'x${NumberFormat('#0.00').format(state.record.intakePercent)}',
                  min: 0.0,
                  max: 10.0,
                  divisions: 10.00 ~/ 0.25,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '日時',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 8),
              CnSecondaryButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: state.record.recordedAt,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now().add(const Duration(days: 1)),
                  );
                  if (date != null) {
                    context
                        .read(recordFormStateProvider(_record))
                        .setRecordedAt(date);
                  }
                },
                leading: const Icon(CupertinoIcons.calendar),
                child: Text(
                  DateFormat('MM月dd日').format(state.record.recordedAt),
                ),
                trailing: const SizedBox(width: 32),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  for (final type in timeTypes) ...[
                    Expanded(
                      child: CnSecondaryButton(
                        onPressed: () => context
                            .read(recordFormStateProvider(_record))
                            .setTimeType(type),
                        selected: type == state.record.timeType,
                        child: Text(CnStr.recordTimeType(type)),
                      ),
                    ),
                    if (type != timeTypes.last) const SizedBox(width: 8),
                  ],
                ],
              ),
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
        const SizedBox(height: 16),
        SizedBox(height: state.isUpdate ? 160 : 96),
      ],
    );
  }
}

class RecordFromBottomButtons extends HookWidget {
  const RecordFromBottomButtons() : super();

  @override
  Widget build(BuildContext context) {
    final _record = useProvider(currentRecordProvider);
    final canSubmitForm = useProvider(recordFormStateProvider(_record)
        .state
        .select((state) => state.canSubmitForm));
    final isUpdate = useProvider(recordFormStateProvider(_record)
        .state
        .select((state) => state.isUpdate));

    return CnBottomButtonsContainer(
      children: [
        CnPrimaryButton(
          onPressed: canSubmitForm
              ? () =>
                  context.read(recordFormStateProvider(_record)).submitForm()
              : null,
          child: const Text('登録'),
        ),
        if (isUpdate)
          CnWarningButton(
            onPressed: () async {
              final result = await showCnConfirmDialog(
                context: context,
                title: const Text('削除しますか？'),
              );
              if (result) {
                await context
                    .read(recordFormStateProvider(_record))
                    .deleteRecord();
              }
            },
            child: const Text('削除'),
          ),
      ],
    );
  }
}
