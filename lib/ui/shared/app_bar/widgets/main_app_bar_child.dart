import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
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
        if (backOnTap != null && RouteService.instance.canPop)
          InkWell(
            onTap: backOnTap,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const SizedBox(width: 16.0),
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
                      color: CustomTheme.colors.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
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
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 35.0,
              child: Image.network(logoUrl),
            ),
          ),
        if (logoUrl == null && title == null)
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 35.0,
              child: SVGImages().mcLogo(),
            ),
          ),
      ],
    );
  }
}
