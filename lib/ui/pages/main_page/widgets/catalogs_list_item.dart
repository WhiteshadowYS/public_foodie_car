import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';

class CatalogsListItem extends StatefulWidget {
  final String title;
  final bool select;
  final void Function() onTap;

  CatalogsListItem({
    @required this.title,
    @required this.select,
    @required this.onTap,
  });

  @override
  _CatalogsListItemState createState() => _CatalogsListItemState();
}

class _CatalogsListItemState extends State<CatalogsListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        color: AppColors.kBlack.withOpacity(0.0),
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
                    style: TextStyle(
                      color: widget.select ? AppColors.kGreen : AppColors.kBlack,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text(widget.title),
                  ),
                  Transform.rotate(
                    angle: FlutterDictionary.instance.isRTL ? pi : 0.0,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.kGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1.5, indent: 10.0, endIndent: 10.0),
          ],
        ),
      ),
    );
  }
}
