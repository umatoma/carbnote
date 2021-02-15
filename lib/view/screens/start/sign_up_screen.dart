import 'package:carbnote/models/exception.dart';
import 'package:carbnote/view/screens/start/sign_up_state.dart';
import 'package:carbnote/view/widgets/animation.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen() : super();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(signUpStateProvider.state);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: WillPopScope(
        onWillPop: () async => false,
        child: CnProgressContainer(
          isProgressing: state.isProcessing,
          child: CnScaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: CnTransparentNavBar(
              leading: CnIconSwitcher(
                duration: const Duration(milliseconds: 300),
                child: state.page == 0
                    ? CnNavButton.close(
                        onPressed: () => Navigator.of(context).pop(),
                        key: const ValueKey('close'),
                      )
                    : CnNavButton.back(
                        onPressed: () =>
                            context.read(signUpStateProvider).prevPage(),
                        key: const ValueKey('back'),
                      ),
              ),
            ),
            body: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: state.controller,
              itemCount: state.itemCount,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const SetGoalPage();
                  case 1:
                    return const SetProfilePage();
                  case 2:
                    return const SetSignInSettingPage();
                  default:
                    throw AppException('存在しないindexです');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SetGoalPage extends HookWidget {
  const SetGoalPage() : super();

  @override
  Widget build(BuildContext context) {
    final List<int> grams = <int>[70, 100, 130];
    final state = useProvider(signUpStateProvider.state);

    return CnBackgroundImageContainer(
      image: const AssetImage('assets/images/sign_up_goal_background.png'),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          children: [
            const SizedBox(height: 92),
            Text(
              '目標',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(color: Colors.white),
            ),
            const SizedBox(height: 32),
            Text(
              '1日あたりの糖質摂取量',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .apply(color: Colors.white),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  for (final gram in grams) ...[
                    Expanded(
                      flex: 1,
                      child: CnSecondaryButton(
                        onPressed: () => context
                            .read(signUpStateProvider)
                            .setGoalCarbGram(gram),
                        selected: state.form.goalCarbGram == gram,
                        child: Text('${gram}g'),
                      ),
                    ),
                    if (grams.last != gram) const SizedBox(width: 16),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '迷ったときは100gがおすすめ',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .apply(color: Colors.white),
            ),
            const Spacer(),
            CnBottomButtonsContainer(
              shadowColor: Colors.black,
              children: [
                CnPrimaryButton(
                  onPressed: () =>
                      context.read(signUpStateProvider).submitGoal(),
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

class SetProfilePage extends HookWidget {
  const SetProfilePage() : super();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(signUpStateProvider.state);

    return CnBackgroundImageContainer(
      image: const AssetImage('assets/images/sign_up_profile_background.png'),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          children: [
            const SizedBox(height: 92),
            Text(
              'プロフィール',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(color: Colors.white),
            ),
            const SizedBox(height: 32),
            CnImageField(
              onPressed: () =>
                  context.read(signUpStateProvider).pickImageFile(),
              image: state.form.imageFile == null
                  ? null
                  : Image.file(
                      state.form.imageFile,
                      key: ValueKey(state.form.imageFile),
                    ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnTextField(
                onChanged: (value) =>
                    context.read(signUpStateProvider).setNickname(value),
                initialValue: state.form.nickname,
                keyboardType: TextInputType.name,
                hintText: 'ニックネーム',
              ),
            ),
            const Spacer(),
            CnBottomButtonsContainer(
              shadowColor: Colors.black,
              children: [
                CnPrimaryButton(
                  onPressed: state.canSubmitProfile
                      ? () => context.read(signUpStateProvider).submitProfile()
                      : null,
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

class SetSignInSettingPage extends HookWidget {
  const SetSignInSettingPage() : super();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(signUpStateProvider.state);

    return CnBackgroundImageContainer(
      image: const AssetImage('assets/images/sign_up_setting_background.png'),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          children: [
            const SizedBox(height: 92),
            Text(
              'ログイン設定',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(color: Colors.white),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  CnTextField(
                    onChanged: (value) =>
                        context.read(signUpStateProvider).setEmail(value),
                    initialValue: state.form.email,
                    hintText: 'メールアドレス',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: CupertinoIcons.mail,
                  ),
                  const SizedBox(height: 16),
                  CnTextField(
                    onChanged: (value) =>
                        context.read(signUpStateProvider).setPassword(value),
                    initialValue: state.form.password,
                    hintText: 'パスワード',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    prefixIcon: CupertinoIcons.lock,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '登録すると、機種変更してもログインできるよ',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .apply(color: Colors.white),
                  ),
                  if (state.error != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      state.error.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .apply(color: Colors.red),
                    ),
                  ],
                  const SizedBox(height: 32),
                  CnSecondaryButton(
                    onPressed: () {},
                    height: 24,
                    child: Text(
                      '利用規約',
                      style: Theme.of(context)
                          .textTheme
                          .overline
                          .apply(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CnBottomButtonsContainer(
              shadowColor: Colors.black,
              children: [
                CnPrimaryButton(
                  onPressed: state.canSubmitSignInSetting
                      ? () => context
                          .read(signUpStateProvider)
                          .sumbitSignInSetting()
                      : null,
                  child: const Text('登録'),
                ),
                CnSecondaryButton(
                  onPressed: () => context
                      .read(signUpStateProvider)
                      .sumbitSignInSetting(skip: true),
                  child: const Text('スキップ'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
