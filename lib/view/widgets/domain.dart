import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:carbnote/view/widgets/image.dart';
import 'package:flutter/material.dart';

class CnRecordListItem extends StatelessWidget {
  const CnRecordListItem({
    Key key,
    @required this.onTap,
    @required this.record,
  }) : super(key: key);

  final void Function() onTap;
  final Record record;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: 48,
                  height: 48,
                  imageUrl: record.imageURL,
                  placeholder: (_, __) => Image.memory(kTransparentImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(record.name),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '食べた量',
                          style: Theme.of(context).textTheme.overline,
                        ),
                        Text('${record.intakeGram}g'),
                        const SizedBox(width: 16),
                        Text(
                          '糖質',
                          style: Theme.of(context).textTheme.overline,
                        ),
                        Text('${record.carbGram}g'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
