import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatefulWidget {
  final String keyValue;
  final String title;
  final void Function() onTap;

  final String Function(String) validator;
  final TextEditingController controller;

  MainButton({
    @required this.keyValue,
    @required this.title,
    @required this.onTap,
    this.validator,
    this.controller,
  }) : super(key: Key(keyValue + 'MainButton'));

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool status = true;

  @override
  void initState() {
    super.initState();
    _validation();
    if (widget.validator != null && widget.controller != null) {
      widget.controller.addListener(_validation);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.validator != null && widget.controller != null) {
      widget.controller.removeListener(_validation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: status ? CustomTheme.colors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Material(
        color: Colors.transparent,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: InkWell(
            key: Key(widget.keyValue),
            onTap: status ? widget.onTap : () {},
            borderRadius: BorderRadius.circular(30.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.buttonTextStyle(
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validation() {
    if (widget.controller.text == null || widget.controller.text == '') {
      status = false;

      setState(() {});
      return;
    }

    if (widget.validator != null) {
      final String result = widget.validator(widget.controller.text);

      status = result == null || result == '';

      setState(() {});
    }
  }
}
