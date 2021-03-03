import 'package:carbnote/models/app_notification_model.dart';
import 'package:carbnote/view/screens/menu/menu_form_screen.dart';
import 'package:carbnote/view/screens/menu/menu_list_state.dart';
import 'package:carbnote/view/screens/record/record_form_screen.dart';
import 'package:carbnote/view/screens/record/record_form_state.dart';
import 'package:carbnote/view/widgets/button.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/model/app_notification.dart';
import 'package:carbnote/view/widgets/model/menu.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuListScreen extends HookWidget {
  const MenuListScreen() : super();

  @override
  Widget build(BuildContext context) {
    return CnScaffold(
      appBar: CnNavBar(
        leading: CnNavButton.close(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: const Text('メニュー'),
        trailing: TextButton(
          onPressed: () async {
            FocusScope.of(context).unfocus();
            context
                .read(formControllerProvider)
                .setCurrentRecordAndMenu(null, null);
            await Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (_) => const RecordFormScreen(),
              ),
            );
          },
          child: const Text('手動で記録'),
        ),
      ),
      body: ProviderListener(
        onChange: (context, StateController<AppNotification> value) {
          if (value.state != null) {
            showAppNotification(
              context: context,
              notification: value.state,
            );
          }
        },
        provider: notificationStateProvider,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: Theme.of(context).primaryColor,
                tabs: const [
                  Tab(child: Text('検索')),
                  Tab(child: Text('MYメニュー')),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    MenuSearchBody(),
                    MyMenuListBody(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuSearchBody extends HookWidget {
  const MenuSearchBody() : super();

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(textEditingControllerProvider);
    final asyncMenus = useProvider(menusStreamProvider);

    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: CnTextField(
            onChanged: (value) =>
                context.read(menusControllerProvider).setInput(value),
            controller: controller,
            hintText: 'りんご',
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: asyncMenus.maybeWhen(
            error: (e, stackTrace) {
              return Center(
                child: Text(
                  e.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .apply(color: Colors.red),
                ),
              );
            },
            orElse: () {
              final menus = asyncMenus.data?.value ?? [];
              return ListView.separated(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menu = menus[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: CnMenuListItem(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        context
                            .read(formControllerProvider)
                            .setCurrentRecordAndMenu(null, menu);
                        await Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (_) => const RecordFormScreen(),
                          ),
                        );
                      },
                      menu: menu,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        CnBottomButtonsContainer(
          children: [
            CnPrimaryButton(
              onPressed: () =>
                  context.read(menusControllerProvider).pickAndEstimateImage(),
              child: const Text('画像検索'),
            ),
          ],
        ),
      ],
    );
  }
}

class MyMenuListBody extends HookWidget {
  const MyMenuListBody() : super();

  @override
  Widget build(BuildContext context) {
    final asyncMenus = useProvider(myMenusStreamProvider);

    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: asyncMenus.maybeWhen(
            error: (e, stackTrace) {
              print(e);
              print(stackTrace);
              return Center(
                child: Text(
                  e.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .apply(color: Colors.red),
                ),
              );
            },
            orElse: () {
              final menus = asyncMenus.data?.value ?? [];
              return ListView.separated(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menu = menus[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: CnMenuListItem(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        context
                            .read(formControllerProvider)
                            .setCurrentRecordAndMenu(null, menu);
                        await Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (_) => const RecordFormScreen(),
                          ),
                        );
                      },
                      menu: menu,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        CnBottomButtonsContainer(
          children: [
            CnPrimaryButton(
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (_) => const MenuFormScreen(),
                ),
              ),
              child: const Text('追加'),
            ),
          ],
        ),
      ],
    );
  }
}
