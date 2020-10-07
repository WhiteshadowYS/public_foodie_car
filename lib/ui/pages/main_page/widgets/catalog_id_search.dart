import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';

import 'catalog_text_field.dart';

class CatalogIdSearchTextField extends StatefulWidget {
  final void Function(String) onSubmitted;
  final void Function(String) onChanged;
  final bool error;

  CatalogIdSearchTextField({
    @required this.onSubmitted,
    @required this.onChanged,
    @required this.error,
  });

  @override
  _CatalogIdSearchTextFieldState createState() => _CatalogIdSearchTextFieldState();
}

class _CatalogIdSearchTextFieldState extends State<CatalogIdSearchTextField> {
  @override
  Widget build(BuildContext context) {
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
                color: AppColors.kRedLight.withRed(228),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64),
                  bottomRight: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  FlutterDictionary.instance.language.mainPageDictionary.errorID,
                  textAlign: TextAlign.center,
                  // TODO(Andrey): Add textStyle;
                  style: TextStyle(color: AppColors.kWhite, fontSize: 12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: CatalogTextField(
              onChange: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              labelText: EXAMPLE_ID,
            ),
          ),
        ],
      ),
    );
  }
}
