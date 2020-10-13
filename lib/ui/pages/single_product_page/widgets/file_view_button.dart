import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class FileViewButton extends StatelessWidget {
  final DummyFile dummyFile;
  final void Function() onTap;

  FileViewButton({
    @required this.dummyFile,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dummyFile.type == "VIDEO")
          ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              backgroundColor: CustomTheme.colors.primaryColor,
              child: Icon(Icons.videocam, color: CustomTheme.colors.background),
            ),
            title: Text(
              'Watch video "${dummyFile.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()]['name']}"',
              style: CustomTheme.textStyles.titleTextStyle(size: 14),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
          ),
        if (dummyFile.type == "IMAGE")
          ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              backgroundColor: CustomTheme.colors.primaryColor,
              child: Icon(Icons.image, color: CustomTheme.colors.background),
            ),
            title: Text(
              'See pictures "${dummyFile.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()]['name']}"',
              style: CustomTheme.textStyles.titleTextStyle(size: 14),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
          ),
        if (dummyFile.type == "PDF")
          ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              backgroundColor: CustomTheme.colors.primaryColor,
              child: Icon(Icons.picture_as_pdf, color: CustomTheme.colors.background),
            ),
            title: Text(
              'Check documents "${dummyFile.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()]['name']}"',
              style: CustomTheme.textStyles.titleTextStyle(size: 14),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
          ),
        Divider(),
      ],
    );
  }
}
