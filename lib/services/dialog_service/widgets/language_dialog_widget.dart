import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/language_dialog.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class LanguageDialogWidget extends StatelessWidget {
  final LanguageDialog dialog;

  LanguageDialogWidget({
    @required String key,
    this.dialog,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: CustomTheme.colors.popupBackground,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 44.0
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 16.0
            ),
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  color: CustomTheme.colors.popupBackground,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Column(
                  children: dialog.list.map((language) {
                    return LanguageItem(
                      key: '${key.toString()}LanguageItem${language.name}',
                      language: language,
                      isSelected: _getIsSelected(language, dialog.selectedLanguage),
                      callback: () {
                        if (language.code != dialog.selectedLanguage) dialog.onItemSelected(language.code);
                        DialogService.instance.close();
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

bool _getIsSelected(LanguageModel language, String selectedLanguage) {
  if (selectedLanguage == null) {
    return language.isDefault ?? false;
  }

  return language.name == selectedLanguage;
}

class LanguageItem extends StatelessWidget {
  final LanguageModel language;
  final Function callback;
  final bool isSelected;

  LanguageItem({
    @required String key,
    @required this.language,
    this.isSelected = false,
    this.callback,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: SizedBox(
        height: 55.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      language.name,
                      style: isSelected
                          ? CustomTheme.textStyles.accentTextStyle(size: 14, fontWeight: FontWeight.bold)
                          : CustomTheme.textStyles.titleTextStyle(size: 14.0),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: isSelected
                          ? CustomTheme.colors.accentFont
                          : CustomTheme.colors.minorFont,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: CustomTheme.colors.font.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}

