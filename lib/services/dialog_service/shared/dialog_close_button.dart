import 'package:flutter/material.dart';
import 'package:base_project_template/services/dialog_service/dialog_service.dart';
import 'package:base_project_template/ui/shared/svg_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogCloseButton extends StatelessWidget {
  final String keyValue;

  DialogCloseButton({
    @required this.keyValue,
  }) : super(key: Key(keyValue));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(55.0),
        onTap: DialogService.instance.close,
        child: Padding(
          padding:  EdgeInsets.all(4.sp),
          child: SVGImages().close(),
        ),
      ),
    );
  }
}
