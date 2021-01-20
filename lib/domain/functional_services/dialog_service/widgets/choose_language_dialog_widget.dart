import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/dictionary/models/supported_locales.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/choose_language_dialog.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/shared/dialog_layout/dialog_layout.dart';

class ChooseLanguageDialogWidget extends StatelessWidget {
  final ChooseLanguageDialog data;

  const ChooseLanguageDialogWidget(this.data) : super(key: const Key('[ChooseLanguageDialogWidget]'));

  void selectFunction(String languageCode) {
    data.selectLanguage(languageCode);
    DialogService.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      key: Key('[ChooseLanguageDialogWidget][DialogLayout]'),
      child: Center(
        child: Container(
          height: 300.sp,
          decoration: BoxDecoration(
            color: CustomTheme.colors.popupBackground,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 24.sp,
          ),
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: SupportedLocales.instance.getSupportedLanguages.map((lng) {
              return ListTile(
                onTap: () => selectFunction(lng.languageCode),
                title: Text(lng.language.name),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
