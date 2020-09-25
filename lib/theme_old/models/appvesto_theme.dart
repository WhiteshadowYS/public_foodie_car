import 'package:pictures_view/theme/models/appvesto_colors.dart';
import 'package:pictures_view/theme/models/appvesto_text_styles.dart';

class AVTheme {
  final String themeName;
  final AVColors colors;
  final AVTextStyles textStyles;

  AVTheme({
    this.themeName,
    this.colors,
    this.textStyles,
  });

  AVTheme copyWith({
    String themeName,
    AVColors colors,
    AVTextStyles textStyles,
  }) {
    return AVTheme(
      themeName: themeName ?? this.themeName,
      colors: colors ?? this.colors,
      textStyles: textStyles ?? this.textStyles,
    );
  }
}