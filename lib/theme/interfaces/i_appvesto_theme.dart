import 'package:pictures_view/theme/interfaces/i_appvesto_colors.dart';
import 'package:pictures_view/theme/interfaces/i_appvesto_edge_insets.dart';
import 'package:pictures_view/theme/interfaces/i_appvesto_text_theme.dart';

abstract class IAVTheme {
  IAVColors colors;
  IAVTextStyles textStyles;
  IAVEdgeInsets edgeInsets;

  IAVTheme copyWith();
}