import 'package:flutter/material.dart';

class CnListTile extends StatelessWidget {
  const CnListTile({
    Key key,
    @required this.onTap,
    @required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final void Function() onTap;
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            if (leading != null) ...[
              leading,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    child: title,
                  ),
                  if (subtitle != null)
                    DefaultTextStyle(
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                      child: subtitle,
                    ),
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 8),
              trailing,
            ],
          ],
        ),
      ),
    );
  }
}
