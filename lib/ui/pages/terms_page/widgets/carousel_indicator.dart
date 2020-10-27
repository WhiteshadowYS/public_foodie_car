import 'package:flutter/material.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CarouselIndicator extends StatelessWidget {
  final bool isSelected;
  CarouselIndicator({@required this.isSelected}) : super(key: Key(TermsPageKeys.carouselIndicator));
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: MILLISECONDS_300,
      margin: EdgeInsets.only(right: 4.0, left: 4.0),
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: CustomTheme.colors.primaryColor),
        color: isSelected ? CustomTheme.colors.primaryColor : CustomTheme.colors.background,
      ),
    );
  }
}
