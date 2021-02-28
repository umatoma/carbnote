import 'package:carbnote/view/screens/menu/menu_form_state.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class MenuFormScreen extends HookWidget {
  const MenuFormScreen() : super();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(menuFormStateProvider).state;

    return CnScaffold(
      appBar: CnNavBar(
        leading: CnNavButton.back(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: const Text('MYメニュー'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Hero(
              tag: 'MenuImage_${state.menu.id}',
              child: Center(
                child: CnImageField.fileOrURL(
                  onPressed: () =>
                      context.read(menuFormControllerProvider).pickImageFile(),
                  icon: CupertinoIcons.photo,
                  imageURL: state.menu.imageURL,
                  imageFile: state.imageFile,
                ),
              ),
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
                  onChanged: (value) =>
                      context.read(menuFormControllerProvider).setName(value),
                  initialValue: state.menu.name,
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
                      .read(menuFormControllerProvider)
                      .setCarbGramPerUnit(value),
                  value: state.menu.carbGramPerUnit,
                  label:
                      '${NumberFormat('##0.0').format(state.menu.carbGramPerUnit)}g',
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
                  onChanged: (value) =>
                      context.read(menuFormControllerProvider).setUnit(value),
                  initialValue: state.menu.unit,
                  hintText: '1個',
                ),
              ],
            ),
          ),
          const Spacer(),
          CnBottomButtonsContainer(
            children: [
              CnPrimaryButton(
                onPressed: state.canSubmitForm
                    ? () =>
                        context.read(menuFormControllerProvider).submitForm()
                    : null,
                child: const Text('登録'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
