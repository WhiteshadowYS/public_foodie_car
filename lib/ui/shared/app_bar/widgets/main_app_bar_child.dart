import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class MainAppBarChild extends StatelessWidget {
  final String title;
  final String backButtonText;
  final String logoUrl;
  final void Function() backOnTap;

  MainAppBarChild({
    @required String key,
    @required this.title,
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
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
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
                      height: 36.h,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 8.0),
                          Transform.rotate(
                            angle: FlutterDictionary.instance.isRTL ? pi : 0.0,
                            child: SizedBox(
                              height: 20.0,
                              child: SVGImages().backArrow(),
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            backButtonText ?? FlutterDictionary.instance.language.appbarDictionary.back,
                            style: TextStyle(
                              color: Color(0xFF5DB075),
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 14.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (title != null)
          Align(
            child: Text(
              title,
              style: CustomTheme.textStyles.titleTextStyle(),
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
