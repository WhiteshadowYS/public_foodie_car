import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/theme/models/appvesto_text_styles.dart';

import 'catalog_text_field.dart';

class CatalogIdSearchTextField extends StatefulWidget {
  final void Function(String) onSubmitted;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final bool error;

  CatalogIdSearchTextField({
    @required String key,
    @required this.onSubmitted,
    @required this.onChanged,
    @required this.controller,
    @required this.error,
  }) : super(key: Key(key));

  @override
  _CatalogIdSearchTextFieldState createState() => _CatalogIdSearchTextFieldState();
}

class _CatalogIdSearchTextFieldState extends State<CatalogIdSearchTextField> {
  @override
  Widget build(BuildContext context) {
    final MainPageDictionary dictionary = FlutterDictionary.instance.language.mainPageDictionary;
    final AVTextStyles textStyles = CustomTheme.textStyles;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          AnimatedContainer(
            duration: widget.error ? MILLISECONDS_500 : MILLISECONDS_300,
            height: 50.0,
            alignment: widget.error ? Alignment.topRight : Alignment.bottomRight,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: 150.0,
              height: 22.0,
              decoration: BoxDecoration(
                color: CustomTheme.colors.errorColor.withOpacity(widget.error ? 1.0 : 0.0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64),
                  bottomRight: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Center(
                child: Text(
                  dictionary.errorID,
                  textAlign: TextAlign.center,
                  style: textStyles.buttonTextStyle(size: 8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: CatalogTextField(
              key: '${widget.key.toString()}CatalogTextField',
              controller: widget.controller,
              onChange: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              labelText: EXAMPLE_ID,
              hintText: dictionary.name,
              textStyle: textStyles.mainTextStyle(size: 16),
              hintTextStyle: textStyles.mainTextStyle(size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
