import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CatalogTextField extends StatefulWidget {
  final void Function(String) onChange;
  final void Function(String) onSubmitted;

  final String labelText;

  final TextStyle textStyle;

  final String hintText;
  final TextStyle hintTextStyle;

  final TextInputType inputType;

  CatalogTextField({
    @required this.onChange,
    this.textStyle,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.hintTextStyle,
    this.inputType = TextInputType.number,
  });

  @override
  _CatalogTextFieldState createState() => _CatalogTextFieldState();
}

class _CatalogTextFieldState extends State<CatalogTextField> {
  TextStyle textStyle;

  @override
  void initState() {
    widget.textStyle == null ? textStyle = TextStyle(fontWeight: FontWeight.bold) : textStyle = widget.textStyle;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          AnimatedContainer(
            height: 50.0,
            duration: MILLISECONDS_300,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomTheme.colors.background,
              border: Border.all(color: AppColors.kGrey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 45.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              keyboardType: widget.inputType,
              cursorColor: AppColors.kGreen,
              onChanged: (String text) {
                widget.onChange(text);
              },
              cursorWidth: 2.0,
              style: textStyle,
              onSubmitted: widget.onSubmitted,
              textInputAction: TextInputAction.none,
              decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 14),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: true,
                labelText: widget.labelText,
                labelStyle: TextStyle(color: AppColors.kGrey.withOpacity(0.5)),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
