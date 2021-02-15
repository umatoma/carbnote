import 'package:carbnote/view/screens/start/sign_in_screen.dart';
import 'package:carbnote/view/screens/start/sign_up_screen.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatelessWidget {
  const StartScreen() : super();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: CnBackgroundImageContainer(
          image: const AssetImage('assets/images/start_background.png'),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Carb Note',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .apply(color: Colors.white),
                    ),
                  ),
                ),
                CnBottomButtonsContainer(
                  shadowColor: Colors.black,
                  children: [
                    CnPrimaryButton(
                      onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => const SignUpScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                      child: const Text('はじめる'),
                    ),
                    CnSecondaryButton(
                      onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => const SignInScreen(),
                          fullscreenDialog: true,
                        ),
                      ),
                      child: const Text('ログイン'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
