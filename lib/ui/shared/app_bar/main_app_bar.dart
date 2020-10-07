import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/theme/models/appvesto_text_styles.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget  {
  MainAppBar({
    @required String key,
    this.height = 44.0,
    this.title,
    this.logoUrl,
    this.backOnTap,
  }) : preferredSize = Size.fromHeight(height),
       super(key: Key(key));

  @override
  final Size preferredSize;

  final String title;
  final String logoUrl;
  final Function backOnTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        width: double.infinity,
        color: CustomTheme.colors.background,
        alignment: Alignment.center,
        child: _getChild(),
      ),
    );
  }

  Widget _getChild() {
    AVTextStyles textStyles = CustomTheme.textStyles;

    if (title != null) {
      if (backOnTap != null) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  SizedBox(
                    height: 20.0,
                    child: SVGImages().backArrow(),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    'Back',
                    style: textStyles.accentTextStyle(
                      size: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              child: Text(
                title,
                style: textStyles.titleTextStyle(
                  size: 18.0,
                ),
              ),
            ),
          ],
        );
      }

      return Text(
        title,
        style: textStyles.titleTextStyle(
          size: 18.0,
        ),
      );
    }

    if (logoUrl != null) {
      if (backOnTap != null) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  SizedBox(
                    height: 20.0,
                    child: SVGImages().backArrow(),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    'Back',
                    style: textStyles.accentTextStyle(
                      size: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              child: SizedBox(
                height: 30.0,
                child: Image.network(
                    logoUrl
                ),
              ),
            ),
          ],
        );
      }

      return SizedBox(
        height: 30.0,
        child: Image.network(
          logoUrl
        ),
      );
    }

    return SizedBox(
      height: 30.0,
      child: SVGImages().mcLogo(),
    );
  }
}
