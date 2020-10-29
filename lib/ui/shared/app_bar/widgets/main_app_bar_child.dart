import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class MainAppBarChild extends StatelessWidget {
  final TextDirection textDirection;
  final String title;
  final String backButtonText;
  final String logoUrl;
  final void Function() backOnTap;

  MainAppBarChild({
    @required String key,
    @required this.title,
    @required this.textDirection,
    this.backOnTap,
    this.logoUrl,
    this.backButtonText,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (backOnTap != null)
          Align(
            alignment: textDirection == TextDirection.ltr ? Alignment.centerLeft : Alignment.centerRight,
            child: Material(
              color: Colors.transparent,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24.0),
                  onTap: backOnTap,
                  child: SizedBox(
                    height: 36.sp,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 14.0),
                        const SizedBox(width: 8.0),
                        const SizedBox(width: 14.0),
                      ]
                        ..insert(
                          textDirection == TextDirection.ltr ? 1 : 2,
                          Transform.rotate(
                            angle: textDirection != TextDirection.ltr ? pi : 0.0,
                            child: SizedBox(
                              height: 16.sp,
                              child: SVGImages().backArrow(),
                            ),
                          ),
                        )
                        ..insert(
                          textDirection == TextDirection.ltr ? 3 : 1,
                          Text(
                            backButtonText ?? FlutterDictionary.instance.language.appbarDictionary.back,
                            style: TextStyle(
                              color: Color(0xFF5DB075),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (title != null)
          Align(
            child: SizedBox(
              width: 200.w,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTheme.textStyles.titleTextStyle(size: 18.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (logoUrl != null)
          Align(
            child: SizedBox(
              height: 35.0,
              child: SvgPicture.network(logoUrl),
            ),
          ),
        if (logoUrl == null && title == null)
          Align(
            child: SizedBox(
              height: 35.0,
              child: SVGImages().mcLogo(),
            ),
          ),
      ],
    );
  }
}
