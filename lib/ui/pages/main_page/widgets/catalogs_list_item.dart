import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: MILLISECONDS_300,
                      style: widget.isSelected ? textStyles.accentTextStyle(size: 14) : textStyles.titleTextStyle(size: 14),
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
              Divider(
                thickness: 1.5,
                indent: 10.0,
                endIndent: 10.0,
                color: colors.accentColor.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
