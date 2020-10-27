import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoBlock extends StatelessWidget {
  final InfoModel info;

  InfoBlock({
    @required String key,
    @required this.info,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.sp,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 35.sp,
            height: 35.sp,
            child: info.logoImage != null &&
              info.logoImage != '' &&
              info.logoImage.length >= 5 &&
              info.logoImage.substring(info.logoImage.length - 4) == '.svg'
                ? SvgPicture.network(info.logoImage)
                : SVGImages().mcLogo(),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            info.title,
            style: CustomTheme.textStyles.titleTextStyle(size: 14.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            info.text,
            style: CustomTheme.textStyles.mainTextStyle(size: 14.h),
          ),
          SizedBox(
            height: 38.h,
          ),
        ],
      ),
    );
  }
}