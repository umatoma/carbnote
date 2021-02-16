import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/start/start_screen.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return CnScaffold(
      appBar: CnNavBar(
        leading: CnNavButton.close(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: const Text('設定'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CnSecondaryButton(
              onPressed: () {},
              child: const Text('フィードバック'),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CnSecondaryButton(
              onPressed: () {},
              child: const Text('お問い合わせ'),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CnSecondaryButton(
              onPressed: () {},
              child: const Text('利用規約'),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CnSecondaryButton(
              onPressed: () {},
              child: const Text('OSSライセンス'),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CnSecondaryButton(
              onPressed: () async {
                await context.read(authUserRepoProvider).signOut();
                await Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute<void>(
                    builder: (_) => const StartScreen(),
                    fullscreenDialog: true,
                  ),
                  (route) => false,
                );
              },
              child: const Text('ログアウト'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
