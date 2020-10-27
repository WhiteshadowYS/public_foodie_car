import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/theme/models/appvesto_text_styles.dart';

class CatalogsListItem extends StatefulWidget {
  final String keyValue;
  final String title;
  final bool isSelected;
  final void Function() onTap;

  CatalogsListItem({
    @required this.keyValue,
    @required this.title,
    @required this.isSelected,
    @required this.onTap,
  }) : super(key: Key(keyValue + 'CatalogsListItem'));

  @override
  _CatalogsListItemState createState() => _CatalogsListItemState();
}

class _CatalogsListItemState extends State<CatalogsListItem> {
  @override
  Widget build(BuildContext context) {
    final AVColors colors = CustomTheme.colors;
    final AVTextStyles textStyles = CustomTheme.textStyles;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: Key(widget.keyValue),
        onTap: widget.onTap,
        child: Container(
          color: Colors.transparent,
          height: 60.0,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: MILLISECONDS_400,
                        style: textStyles.accentTextStyle(
                          color: widget.isSelected ? CustomTheme.colors.primaryColor : CustomTheme.colors.accentColor,
                          size: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                        child: Text(widget.title),
                      ),
                      Transform.rotate(
                        angle: FlutterDictionary.instance.isRTL ? pi : 0.0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: colors.accentColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1.5,
                width: double.infinity,
                color: colors.accentColor.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
