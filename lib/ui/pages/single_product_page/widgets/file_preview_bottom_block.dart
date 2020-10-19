import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            style: CustomTheme.textStyles.titleTextStyle(size: 14.sp),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25.0),
              splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
              highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
              // TODO(Daniil): Add onTap
              onTap: () {},
              child: Icon(
                Icons.share,
                color: CustomTheme.colors.primaryColor,
                size: 42.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
