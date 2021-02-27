import 'package:carbnote/view/screens/menu/menu_list_state.dart';
import 'package:carbnote/view/screens/record/record_form_screen.dart';
import 'package:carbnote/view/screens/record/record_form_state.dart';
import 'package:carbnote/view/widgets/form.dart';
import 'package:carbnote/view/widgets/list_tile.dart';
import 'package:carbnote/view/widgets/nav_bar.dart';
import 'package:carbnote/view/widgets/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
      ),
      body: DefaultTabController(
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
    );
  }
}

class MenuSearchBody extends HookWidget {
  const MenuSearchBody() : super();

  @override
  Widget build(BuildContext context) {
    final asyncMenus = useProvider(menusStreamProvider);

    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: CnTextField(
            onChanged: (value) =>
                context.read(menusControllerProvider).setInput(value),
            hintText: 'りんご',
            initialValue: '',
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
                    child: CnListTile(
                      onTap: () async {
                        context
                            .read(formControllerProvider)
                            .setCurrentRecordAndMenu(null, menu);
                        await Navigator.of(context).push(
                          CupertinoPageRoute<void>(
                            builder: (_) => const RecordFormScreen(),
                          ),
                        );
                      },
                      title: Text(menu.name),
                      subtitle: Text(menu.unit),
                      trailing: SizedBox(
                        width: 64,
                        child: Column(
                          children: [
                            Text(
                              '${NumberFormat('##0.0').format(menu.carbGramPerUnit)}g',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              '糖質',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
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
      ],
    );
  }
}

class MyMenuListBody extends HookWidget {
  const MyMenuListBody() : super();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
