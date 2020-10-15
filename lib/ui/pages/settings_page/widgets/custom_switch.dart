import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  bool value;
  final void Function(bool) callBack;
  final Color activeColor;
  final Color inactiveColor;
  final Color circleColor;

  CustomSwitch({
    @required String key,
    @required this.value,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.circleColor,
    this.callBack,
  }) : super(key: Key(key));

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.callBack != null) {
          setState(() {
            widget.value = !widget.value;
            if (widget.value != null) widget.callBack(widget.value);
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        height: 29.0,
        width: 56.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.0,
            color: widget.value
                ? widget.activeColor
                : widget.inactiveColor,
          ),
          borderRadius: BorderRadius.circular(50.0),
          color: widget.value
              ? widget.activeColor
              : widget.inactiveColor,
        ),
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: !widget.value
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 22.0,
                width: 22.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  color: widget.circleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}