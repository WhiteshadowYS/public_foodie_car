import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

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
        horizontal: 16.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: 35.0,
            height: 35.0,
            child: info.logoImage != null && info.logoImage != ''
                ? SvgPicture.network(info.logoImage)
                : SVGImages().mcLogo(),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            info.title,
            style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
          ),
          SizedBox(
            height: 14.0,
          ),
          Text(
            info.text,
            style: CustomTheme.textStyles.mainTextStyle(size: 14.0),
          ),
          SizedBox(
            height: 38.0,
          ),
        ],
      ),
    );
  }
}