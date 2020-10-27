// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDataModel _$LanguageDataModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('LanguageDataModel', json, () {
    final val = LanguageDataModel(
      errorText:
          $checkedConvert(json, 'error_text', (v) => v as Map<String, dynamic>),
      acceptText: $checkedConvert(
          json, 'accept_text', (v) => v as Map<String, dynamic>),
      shareText:
          $checkedConvert(json, 'share_text', (v) => v as Map<String, dynamic>),
      descriptionText: $checkedConvert(
          json, 'description_text', (v) => v as Map<String, dynamic>),
      logoutText: $checkedConvert(
          json, 'logout_text', (v) => v as Map<String, dynamic>),
      backButtonText: $checkedConvert(
          json, 'back_button_text', (v) => v as Map<String, dynamic>),
      termsButtonText: $checkedConvert(
          json, 'terms_button_text', (v) => v as Map<String, dynamic>),
      termsTitle: $checkedConvert(
          json, 'terms_title', (v) => v as Map<String, dynamic>),
      termsSubTitle: $checkedConvert(
          json, 'tac_subtitle', (v) => v as Map<String, dynamic>),
      terms2SubTitle: $checkedConvert(
          json, 'tac2_subtitle', (v) => v as Map<String, dynamic>),
      termsAcceptButton: $checkedConvert(
          json, 'terms_accept_button', (v) => v as Map<String, dynamic>),
      productsTitle: $checkedConvert(
          json, 'products_title', (v) => v as Map<String, dynamic>),
      categoriesTitle: $checkedConvert(
          json, 'categories_title', (v) => v as Map<String, dynamic>),
      subcategoriesTitle: $checkedConvert(
          json, 'subcategories_title', (v) => v as Map<String, dynamic>),
      settingsTitle: $checkedConvert(
          json, 'settings_title', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {
    'errorText': 'error_text',
    'acceptText': 'accept_text',
    'shareText': 'share_text',
    'descriptionText': 'description_text',
    'logoutText': 'logout_text',
    'backButtonText': 'back_button_text',
    'terms_button_text': 'terms_button_text',
    'termsTitle': 'terms_title',
    'tac_subtitle': 'tac_subtitle',
    'tac2_subtitle': 'tac2_subtitle',
    'termsAcceptButton': 'terms_accept_button',
    'productsTitle': 'products_title',
    'categoriesTitle': 'categories_title',
    'subcategoriesTitle': 'subcategories_title',
    'settingsTitle': 'settings_title'
  });
}

Map<String, dynamic> _$LanguageDataModelToJson(LanguageDataModel instance) =>
    <String, dynamic>{
      'error_text': instance.errorText,
      'accept_text': instance.acceptText,
      'share_text': instance.shareText,
      'description_text': instance.descriptionText,
      'logout_text': instance.logoutText,
      'back_button_text': instance.backButtonText,
      'terms_button_text': instance.termsButtonText,
      'terms_title': instance.termsTitle,
      'tac_subtitle': instance.termsSubTitle,
      'tac2_subtitle': instance.terms2SubTitle,
      'terms_accept_button': instance.termsAcceptButton,
      'products_title': instance.productsTitle,
      'categories_title': instance.categoriesTitle,
      'subcategories_title': instance.subcategoriesTitle,
      'settings_title': instance.settingsTitle,
    };
