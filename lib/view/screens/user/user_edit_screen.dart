import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbnote/view/screens/user/user_edit_state.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileEditScreen extends HookWidget {
  const ProfileEditScreen() : super();

  @override
  Widget build(BuildContext context) {
    final grams = [70, 100, 130];
    final state = useProvider(userEditStateProvider.state);

    return CnProgressContainer(
      isProgressing: state.isProcessing,
      child: CnScaffold(
        appBar: CnNavBar(
          leading: CnNavButton.close(
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: const Text('プロフィール設定'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Hero(
                tag: 'ProfileImage',
                child: CnImageField(
                  onPressed: () =>
                      context.read(userEditStateProvider).pickImageFile(),
                  icon: CupertinoIcons.person,
                  image: state.form.imageFile == null
                      ? CachedNetworkImage(imageUrl: state.form.imageURL)
                      : Image.file(state.form.imageFile),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnTextField(
                onChanged: (value) =>
                    context.read(userEditStateProvider).setNickname(value),
                initialValue: state.form.nickname,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('１日あたりの糖質摂取量'),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (final gram in grams) ...[
                        Expanded(
                          child: CnSecondaryButton(
                            onPressed: () => context
                                .read(userEditStateProvider)
                                .setGoalCarbGram(gram),
                            selected: state.form.goalCarbGram == gram,
                            child: Text('${gram}g'),
                          ),
                        ),
                        if (gram != grams.last) const SizedBox(width: 8),
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
            const Spacer(),
            CnBottomButtonsContainer(
              children: [
                CnPrimaryButton(
                  onPressed: () =>
                      context.read(userEditStateProvider).submitForm(),
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
