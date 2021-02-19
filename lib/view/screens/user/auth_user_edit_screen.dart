import 'package:carbnote/view/screens/user/auth_user_edit_state.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInEditScreen extends HookWidget {
  const SignInEditScreen() : super();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(authUserEditStateProvider.state);

    return CnProgressContainer(
      isProgressing: state.isProcessing,
      child: CnScaffold(
        appBar: CnNavBar(
          leading: CnNavButton.close(
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: const Text('ログイン設定'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnTextField(
                onChanged: (value) =>
                    context.read(authUserEditStateProvider).setEmail(value),
                initialValue: state.form.email,
                prefixIcon: CupertinoIcons.mail,
                keyboardType: TextInputType.emailAddress,
                hintText: state.authUser.isAnonymous ? 'メールアドレス' : '新しいメールアドレス',
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CnTextField(
                onChanged: (value) =>
                    context.read(authUserEditStateProvider).setPassword(value),
                initialValue: state.form.password,
                prefixIcon: CupertinoIcons.lock,
                keyboardType: TextInputType.visiblePassword,
                hintText: state.authUser.isAnonymous ? 'パスワード' : '現在のパスワード',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text('現在のメールアドレス'),
              ),
            ),
            Text(
              state.authUser.isAnonymous ? '未登録' : state.authUser.email,
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
                          context.read(authUserEditStateProvider).submitForm()
                      : null,
                  child: const Text('登録'),
                ),
                CnSecondaryButton(
                  onPressed: state.authUser.isAnonymous
                      ? null
                      : () => context
                          .read(authUserEditStateProvider)
                          .sendPasswordResetEmail(),
                  child: const Text('パスワード再設定メール送信'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
