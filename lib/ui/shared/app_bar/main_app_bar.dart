import 'package:flutter/material.dart';
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
        color: Color(0xFFFFFFFF),
        alignment: Alignment.center,
        child: _getChild(),
      ),
    );
  }

  Widget _getChild() {
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
                    style: TextStyle(
                      color: Color(0xFF5DB075),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF494949),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }

      return Text(
        title,
        style: TextStyle(
          color: Color(0xFF494949),
          fontSize: 18,
          fontWeight: FontWeight.bold,
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
                    style: TextStyle(
                      color: Color(0xFF5DB075),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
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
