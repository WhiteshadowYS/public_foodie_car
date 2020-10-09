import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class MainButton extends StatefulWidget {
  final String title;
  final void Function() onTap;

  MainButton({
    @required String key,
    @required this.title,
    @required this.onTap,
  }) : super(key: Key(key));

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.colors.primaryColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(16.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          splashColor: CustomTheme.colors.background.withOpacity(0.4),
          highlightColor: CustomTheme.colors.background.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              // TODO(Andrey): Add theme;
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18,
                color: AppColors.kWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
