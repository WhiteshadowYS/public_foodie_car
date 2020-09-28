import 'package:pictures_view/theme/models/appvesto_colors.dart';
import 'package:pictures_view/theme/models/appvesto_text_styles.dart';

import 'package:pictures_view/theme/interfaces/i_appvesto_theme.dart';
import 'package:pictures_view/theme/interfaces/i_appvesto_colors.dart';
import 'package:pictures_view/theme/interfaces/i_appvesto_text_theme.dart';
import 'package:pictures_view/theme/interfaces/i_appvesto_edge_insets.dart';

class AVTheme implements IAVTheme {
  final String themeName;
  @override
  IAVColors colors;
  @override
  IAVTextStyles textStyles;
  @override
  IAVEdgeInsets edgeInsets;

  AVTheme({
    this.themeName,
    this.colors,
    this.textStyles,
    this.edgeInsets,
  });

  @override
  AVTheme copyWith({
    String themeName,
    AVColors colors,
    AVTextStyles textStyles,
    AVTextStyles edgeInsets,
  }) {
    return AVTheme(
      colors: colors ?? this.colors,
      themeName: themeName ?? this.themeName,
      textStyles: textStyles ?? this.textStyles,
      edgeInsets: textStyles ?? this.edgeInsets,
    );
  }
}