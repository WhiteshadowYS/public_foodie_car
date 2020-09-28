import 'package:flutter/material.dart';
import 'package:pictures_view/theme/models/appvesto_colors.dart';
import 'package:pictures_view/theme/models/appvesto_edge_insets.dart';
import 'package:pictures_view/theme/models/appvesto_text_styles.dart';
import 'package:pictures_view/theme/models/appvesto_theme.dart';

AVTheme defaultTheme = AVTheme(
  themeName: 'default_theme',
  colors: AVColors(
    accentColor: Colors.red,
    primaryColor: Colors.white,
  ),
  textStyles: AVTextStyles(
    accentTextStyle: TextStyle(),
    primaryTextStyle: TextStyle(),
  ),
  edgeInsets: AVEdgeInsets(
    primaryEdgeInsets: EdgeInsets.all(16.0),
  ),
);