import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/user/user_edit_screen.dart';
import 'package:carbnote/view/screens/user/auth_user_edit_screen.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen() : super();

  @override
  Widget build(BuildContext context) {
    final authUser = useProvider(authUserProvider);
    final user = useProvider(currentUserProvider);

    return CnScaffold(
      appBar: CnNavBar(
        leading: CnNavButton.back(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: const Text('プロフィール'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Center(
            child: Hero(
              tag: 'ProfileImage',
              child: CnCircleImage(
                user?.imageURL,
                size: 128,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            user?.nickname ?? '...',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Text(
            authUser?.email ?? 'ログイン情報未登録',
          ),
          const SizedBox(height: 32),
          Text(
            '1日あたりの糖質摂取量',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Text(
            '目標 ${user?.goalCarbGram ?? '...'}g',
          ),
          const Spacer(),
          CnBottomButtonsContainer(
            children: [
              CnPrimaryButton(
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (_) => const ProfileEditScreen(),
                    fullscreenDialog: true,
                  ),
                ),
                child: const Text('プロフィール設定'),
              ),
              CnSecondaryButton(
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (_) => const SignInEditScreen(),
                    fullscreenDialog: true,
                  ),
                ),
                child: const Text('ログイン設定'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CnFavButton(),
      bottomNavigationBar: const CnBottomNav(index: 3),
    );
  }
}
