import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenInBrowserButton extends StatelessWidget {
  final String url;

  OpenInBrowserButton({@required this.url}) : super(key: Key('OpenInBrowserButton'));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(35.0),
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
          child: Icon(
            Icons.open_in_browser,
            color: CustomTheme.colors.primaryColor,
            size: 42.h,
          ),
        ),
      ),
    );
  }
}
