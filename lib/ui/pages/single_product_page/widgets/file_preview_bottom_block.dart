import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share/share.dart';

class FilePreviewBottomBlock extends StatelessWidget {
  final String itemName;
  final String fileUrl;

  FilePreviewBottomBlock({@required this.itemName, @required this.fileUrl,})
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
            style: CustomTheme.textStyles.titleTextStyle(size: 12.sp),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25.0),
              onTap: () => _onShare(context),
              child: Icon(
                Icons.share,
                color: CustomTheme.colors.primaryColor,
                size: 42.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onShare(BuildContext context) async {
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The RaisedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject();
      await Share.share(fileUrl,
          subject: itemName ,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

