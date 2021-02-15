import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbnote/view/screens/user/profile_edit_state.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class ProfileEditScreen extends HookWidget {
  const ProfileEditScreen() : super();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(profileEditStateProvider.state);

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
                      context.read(profileEditStateProvider).pickImageFile(),
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
                    context.read(profileEditStateProvider).setNickname(value),
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
                      Expanded(
                        child: CnSecondaryButton(
                          onPressed: () {},
                          child: const Text('70g'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CnSecondaryButton(
                          onPressed: () {},
                          child: const Text('100g'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CnSecondaryButton(
                          onPressed: () {},
                          child: const Text('130g'),
                        ),
                      ),
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
                      context.read(profileEditStateProvider).submitForm(),
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
