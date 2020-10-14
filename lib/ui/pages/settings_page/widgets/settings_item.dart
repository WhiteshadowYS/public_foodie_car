import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class SettingsItem extends StatelessWidget {
  final String text;
  final Widget child;
  final Function callback;

  SettingsItem({
    @required String key,
    @required this.text,
    @required this.child,
    @required this.callback,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 65.0,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: child,
                  ),
                ],
              ),
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: CustomTheme.colors.font.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}