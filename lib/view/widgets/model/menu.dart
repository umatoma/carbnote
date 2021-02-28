import 'package:carbnote/models/menu_model.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:carbnote/view/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CnMenuListItem extends StatelessWidget {
  const CnMenuListItem({
    Key key,
    @required this.onTap,
    @required this.menu,
  }) : super(key: key);

  final void Function() onTap;
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return CnListTile(
      onTap: onTap,
      leading: menu.imageURL == null
          ? null
          : Hero(
              tag: 'RecordImage_${menu.id}',
              child: CnCircleImage(menu.imageURL),
            ),
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
    );
  }
}
