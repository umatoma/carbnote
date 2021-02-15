import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/setting/setting_screen.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen() : super();

  @override
  Widget build(BuildContext context) {
    return CnScaffold(
      appBar: CnNavBar(
        middle: const Text('Carb Note'),
        trailing: CnNavButton.gear(
          onPressed: () => Navigator.of(context).push(
            CupertinoPageRoute<void>(
              builder: (_) => SettingScreen(),
              fullscreenDialog: true,
            ),
          ),
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: AuthUserRow(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.add),
      ),
      bottomNavigationBar: const CnBottomNav(index: 0),
    );
  }
}

class AuthUserRow extends HookWidget {
  const AuthUserRow() : super();

  @override
  Widget build(BuildContext context) {
    final authUser = useProvider(currentUserProvider);

    return Row(
      children: [
        Hero(
          tag: 'ProfileImage',
          child: CnProfileImage(
            authUser?.imageURL,
            size: 48,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authUser == null ? '...' : 'Hi ${authUser.nickname}',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(authUser == null ? '...' : '今日は残り20gの糖質が取れるよ'),
            ],
          ),
        ),
      ],
    );
  }
}
