import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/home/home_screen.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class WelcomeBackScreen extends HookWidget {
  const WelcomeBackScreen() : super();

  @override
  Widget build(BuildContext context) {
    final user = useProvider(currentUserProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: CnBackgroundImageContainer(
          image: const AssetImage('assets/images/welcome_back_background.png'),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '${user?.nickname ?? "..."} さん\n'),
                            const TextSpan(text: 'おかえりなさい！'),
                          ],
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .apply(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                CnBottomButtonsContainer(
                  shadowColor: Colors.black,
                  children: [
                    CnPrimaryButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                        CupertinoPageRoute<void>(
                          builder: (_) => const HomeScreen(),
                        ),
                      ),
                      child: const Text('OK'),
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