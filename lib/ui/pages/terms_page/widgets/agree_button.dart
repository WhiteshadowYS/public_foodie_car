import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';

import 'accept_check_box.dart';

class AgreeButton extends StatefulWidget {
  final void Function() onTap;
  final String title;
  final Duration duration;

  AgreeButton({
    @required this.onTap,
    @required this.title,
    this.duration = const Duration(milliseconds: 500),
  })  : assert(title != null && onTap != null),
        super(key: Key('AgreeButton'));

  @override
  _AgreeButtonState createState() => _AgreeButtonState();
}

class _AgreeButtonState extends State<AgreeButton> {
  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AcceptCheckBox(
            duration: widget.duration,
            accept: accept,
          ),
          const SizedBox(width: 10),
          Text(
            widget.title,
            style: CustomTheme.textStyles.titleTextStyle(size: 18.0),
          ),
        ],
      ),
    );
  }

  void _onTap() {
    Future.delayed(widget.duration).then((value) {
     // widget.onTap();
    });
    setState(() {
      accept = true;
    });
  }
}
