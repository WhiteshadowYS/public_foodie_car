import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CatalogTextField extends StatelessWidget {
  final void Function(String) onSubmitted;
  final void Function(String) validator;

  final String labelText;
  final TextStyle textStyle;
  final String hintText;
  final TextStyle hintTextStyle;
  final TextInputType inputType;

  final FocusNode focusNode;
  final TextEditingController controller;

  CatalogTextField({
    @required String key,
    @required this.controller,
    this.focusNode,
    this.textStyle,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.hintTextStyle,
    this.inputType = TextInputType.number,
    this.validator,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: 50.0,
            width: double.infinity,
            color: CustomTheme.colors.background,
          ),
          Container(
            alignment: Alignment.center,
            height: 45.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: CustomTheme.colors.accentColor.withOpacity(0.1),
              border: Border.all(color: AppColors.kGrey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              key: key,
              focusNode: focusNode,
              controller: controller,
              keyboardType: inputType,
              cursorColor: AppColors.kGreen,
              style: textStyle,
              onChanged: validator,
              onFieldSubmitted: onSubmitted,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                alignLabelWithHint: true,
                labelText: labelText,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: hintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
