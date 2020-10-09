import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class FilePreviewBottomBlock extends StatelessWidget {
  final String itemName;

  FilePreviewBottomBlock({@required this.itemName})
      : assert(itemName != null, throw ('itemName should be not null')),
        super(key: Key('FilePreviewBottomBlock'));
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName,
            style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
          ),
          IconButton(
            icon: Icon(Icons.share),
            color: CustomTheme.colors.buttons,
            iconSize: 35,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
