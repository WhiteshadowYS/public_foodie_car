import 'package:foody_client_template/data/theme/interfaces/i_app_edge_insets.dart';
import 'package:foody_client_template/data/theme/models/app_colors.dart';
import 'package:foody_client_template/data/theme/models/app_edge_insets.dart';
import 'package:foody_client_template/data/theme/models/app_text_styles.dart';

class AppTheme {
  final String themeName;
  AppColors colors;
  AppTextStyles textStyles;
  AppEdgeInsets edgeInsets;

  AppTheme({
    this.themeName,
    this.colors,
    this.textStyles,
    this.edgeInsets,
  });

  AppTheme copyWith({String themeName, AppColors colors, AppTextStyles textStyles, IAppEdgeInsets edgeInsets}) {
    return AppTheme(
      colors: colors ?? this.colors,
      themeName: themeName ?? this.themeName,
      textStyles: textStyles ?? this.textStyles,
      edgeInsets: edgeInsets ?? this.edgeInsets,
    );
  }
}
