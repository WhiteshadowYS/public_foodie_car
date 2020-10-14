import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/services/focus_service/focus_service.dart';
import 'package:my_catalog/theme/custom_theme.dart';

import 'catalog_text_field.dart';

class CatalogIdSearchTextField extends StatefulWidget {
  final String focusKeyValue;
  final FocusService focusService;
  final TextEditingController controller;
  final String Function(String) validator;

  CatalogIdSearchTextField({
    @required this.focusService,
    @required this.focusKeyValue,
    @required this.controller,
    @required this.validator,
  }) : super(key: Key(focusKeyValue + 'CatalogIdSearchTextField'));

  @override
  _CatalogIdSearchTextFieldState createState() => _CatalogIdSearchTextFieldState();
}

class _CatalogIdSearchTextFieldState extends State<CatalogIdSearchTextField> {
  String _errorText;

  bool get hasError => _errorText != null && _errorText != '';

  @override
  void didUpdateWidget(CatalogIdSearchTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    validatorCallback(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final MainPageDictionary dictionary = FlutterDictionary.instance.language.mainPageDictionary;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        AnimatedContainer(
          curve: Curves.bounceOut,
          duration: hasError ? MILLISECONDS_500 : MILLISECONDS_300,
          height: 50.0,
          alignment: hasError ? Alignment.topRight : Alignment.bottomRight,
          child: AnimatedContainer(
            duration: hasError ? MILLISECONDS_500 : MILLISECONDS_300,
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            width: 150.0,
            height: 22.0,
            decoration: BoxDecoration(
              color: CustomTheme.colors.errorColor.withOpacity(hasError ? 1.0 : 0.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(64.0),
                topRight: Radius.circular(32.0),
                bottomRight: Radius.circular(32.0),
              ),
            ),
            child: Center(
              child: Text(
                _errorText ?? '',
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.buttonTextStyle(size: 8),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: CatalogTextField(
            keyValue: widget.focusKeyValue,
            controller: widget.controller,
            focusNode: widget.focusService.getKeyByValue(widget.focusKeyValue).focusNode,
            onSubmitted: (String value) {
              widget.focusService.nextFocus(
                context: context,
                currentFocusKeyValue: widget.focusKeyValue,
              );
            },
            validator: validatorCallback,
            hintText: dictionary.name,
            textStyle: CustomTheme.textStyles.mainTextStyle(size: 16),
            hintTextStyle: CustomTheme.textStyles.mainTextStyle(size: 16),
          ),
        ),
      ],
    );
  }

  void validatorCallback(String arg) {
    final String result = widget.validator(arg);

    setState(() => _errorText = result);
  }
}
