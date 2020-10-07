import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksButton extends StatefulWidget {
  final String title;
  final String url;

  LinksButton({
    @required String key,
    @required this.title,
    @required this.url,
  }) : super(key: Key(key));

  @override
  _LinksButtonState createState() => _LinksButtonState();
}

class _LinksButtonState extends State<LinksButton> {
  bool _tap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedDefaultTextStyle(
        duration: MILLISECONDS_300,
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 18,
          color: AppColors.kGreen,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
          decorationThickness: 5.0,
          decorationColor: _tap ? AppColors.kGreen.withOpacity(0.0) : AppColors.kGreen,
        ),
        child: Text(
          widget.title,
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _tap = true;
    setState(() {});
  }

  void _onTapUp(TapUpDetails details) {
    _tap = false;
    _launchInBrowser(widget.url);
    setState(() {});
  }

  void _onTapCancel() {
    _tap = false;
    setState(() {});
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
