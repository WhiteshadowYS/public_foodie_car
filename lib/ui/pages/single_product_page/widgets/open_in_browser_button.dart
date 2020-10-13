import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenInBrowserButton extends StatelessWidget {
  String url;

  OpenInBrowserButton({@required this.url}) : super(key: Key('OpenInBrowserButton'));
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25.0),
        splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
        highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
        child: Icon(
          Icons.open_in_browser,
          color: CustomTheme.colors.primaryColor,
          size: 42.0,
        ),
      ),
    );
  }
}
