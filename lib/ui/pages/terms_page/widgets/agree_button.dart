import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';

import 'accept_check_box.dart';

///Button with checkbox which show check icon and call function passed as a parameter in [onTap] after some time passed in [duration]
///[AgreeButton] takes 2 required parameters [onTap], [title] and 1 not required [duration]. Default [duration] is 500 milliseconds.
class AgreeButton extends StatefulWidget {
  final Function onTap;
  final String title;
  final bool isAccepted;
  final Duration duration;

  AgreeButton({
    @required this.onTap,
    @required this.title,
    this.isAccepted = false,
    this.duration = const Duration(milliseconds: 1500),
  }) : super(key: Key('AgreeButton'));

  @override
  _AgreeButtonState createState() => _AgreeButtonState();
}

class _AgreeButtonState extends State<AgreeButton> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24.0),
          splashColor: CustomTheme.colors.background,
          highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.4),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AcceptCheckBox(
                  duration: widget.duration,
                  accept: widget.isAccepted,
                ),
                const SizedBox(width: 10.0),
                Text(
                  widget.title,
                  style: CustomTheme.textStyles.titleTextStyle(size: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
