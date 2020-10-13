import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:my_catalog/theme/models/appvesto_edge_insets.dart';
import 'package:my_catalog/theme/models/appvesto_text_styles.dart';

import 'package:my_catalog/theme/interfaces/i_appvesto_edge_insets.dart';

class AVTheme {
  final String themeName;
  AVColors colors;
  AVTextStyles textStyles;
  AVEdgeInsets edgeInsets;

  AVTheme({
    this.themeName,
    this.colors,
    this.textStyles,
    this.edgeInsets,
  });

  AVTheme copyWith({String themeName, AVColors colors, AVTextStyles textStyles, IAVEdgeInsets edgeInsets}) {
    return AVTheme(
      colors: colors ?? this.colors,
      themeName: themeName ?? this.themeName,
      textStyles: textStyles ?? this.textStyles,
      edgeInsets: edgeInsets ?? this.edgeInsets,
    );
  }
}
