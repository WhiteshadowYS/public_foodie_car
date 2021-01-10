import 'package:foody_client_template/data/theme/interfaces/i_app_colors.dart';
import 'package:foody_client_template/data/theme/interfaces/i_app_edge_insets.dart';
import 'package:foody_client_template/data/theme/interfaces/i_app_text_theme.dart';

abstract class IAppTheme {
  IAppColors colors;
  IAppTextStyles textStyles;
  IAppEdgeInsets edgeInsets;

  IAppTheme copyWith();
}
