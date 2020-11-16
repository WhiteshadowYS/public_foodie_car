import 'package:base_project_template/theme/interfaces/i_appvesto_colors.dart';
import 'package:base_project_template/theme/interfaces/i_appvesto_edge_insets.dart';
import 'package:base_project_template/theme/interfaces/i_appvesto_text_theme.dart';

abstract class IAVTheme {
  IAVColors colors;
  IAVTextStyles textStyles;
  IAVEdgeInsets edgeInsets;

  IAVTheme copyWith();
}