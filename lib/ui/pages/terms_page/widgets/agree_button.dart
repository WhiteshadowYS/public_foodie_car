import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';

import 'accept_check_box.dart';

///Button with checkbox which show check icon and call function passed as a parameter in [onTap] after some time passed in [duration]
///[AgreeButton] takes 2 required parameters [onTap], [title] and 1 not required [duration]. Default [duration] is 500 milliseconds.
class AgreeButton extends StatefulWidget {
  final void Function() onTap;
  final String title;
  final Duration duration;

  AgreeButton({
    @required this.onTap,
    @required this.title,
    this.duration = const Duration(milliseconds: 1500),
  })  : assert(title != null && onTap != null),
        super(key: Key('AgreeButton'));

  @override
  _AgreeButtonState createState() => _AgreeButtonState();
}

class _AgreeButtonState extends State<AgreeButton> {
  ///This variable is responsible for displaying check icon
  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AcceptCheckBox(
                duration: widget.duration,
                accept: accept,
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
    );
  }

  ///This function add [duration] before [onTap] function and set [accept] true to show checkIcon
  void _onTap() {
    Future.delayed(widget.duration).then((value) {
      if (accept) {
        widget.onTap();
      }
    });
    setState(() {
      accept = !accept;
    });
  }
}
