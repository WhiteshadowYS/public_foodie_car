import 'package:flutter/painting.dart';
import 'package:pictures_view/theme/interfaces/i_appvesto_text_theme.dart';

class AVTextStyles implements IAVTextStyles{
  @override
  TextStyle primaryTextStyle;
  TextStyle accentTextStyle;

  AVTextStyles({
    this.accentTextStyle,
    this.primaryTextStyle,
  });
}