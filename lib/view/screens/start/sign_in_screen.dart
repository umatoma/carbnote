import 'package:carbnote/view/screens/start/sign_in_state.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class SignInScreen extends HookWidget {
  const SignInScreen() : super();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(signInStateProvider.state);

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
              leading: CnNavButton.close(
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: CnBackgroundImageContainer(
              image: const AssetImage('assets/images/sign_in_background.png'),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  children: [
                    const SizedBox(height: 92),
                    Text(
                      'ログイン',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .apply(color: Colors.white),
                    ),
                    const SizedBox(height: 64),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          CnTextField(
                            onChanged: (value) => context
                                .read(signInStateProvider)
                                .setEmail(value),
                            initialValue: state.email,
                            hintText: 'メールアドレス',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: CupertinoIcons.mail,
                          ),
                          const SizedBox(height: 16),
                          CnTextField(
                            onChanged: (value) => context
                                .read(signInStateProvider)
                                .setPassword(value),
                            initialValue: state.password,
                            hintText: 'パスワード',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            prefixIcon: CupertinoIcons.lock,
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
                        ],
                      ),
                    ),
                    const Spacer(),
                    CnBottomButtonsContainer(
                      shadowColor: Colors.black,
                      children: [
                        CnPrimaryButton(
                          onPressed: state.canSignIn
                              ? () => context.read(signInStateProvider).signIn()
                              : null,
                          child: const Text('ログイン'),
                        ),
                        CnSecondaryButton(
                          onPressed: state.canResetPassword
                              ? () => context
                                  .read(signInStateProvider)
                                  .resetPassword()
                              : null,
                          child: const Text('入力したアドレスでパスワード再発行'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
