// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_language_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRLanguageDataDto _$GDRLanguageDataDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRLanguageDataDto', json, () {
    final val = GDRLanguageDataDto(
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
      termsTitle: $checkedConvert(
          json, 'terms_title', (v) => v as Map<String, dynamic>),
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
    'termsTitle': 'terms_title',
    'termsAcceptButton': 'terms_accept_button',
    'productsTitle': 'products_title',
    'categoriesTitle': 'categories_title',
    'subcategoriesTitle': 'subcategories_title',
    'settingsTitle': 'settings_title'
  });
}

Map<String, dynamic> _$GDRLanguageDataDtoToJson(GDRLanguageDataDto instance) =>
    <String, dynamic>{
      'error_text': instance.errorText,
      'accept_text': instance.acceptText,
      'share_text': instance.shareText,
      'description_text': instance.descriptionText,
      'logout_text': instance.logoutText,
      'back_button_text': instance.backButtonText,
      'terms_title': instance.termsTitle,
      'terms_accept_button': instance.termsAcceptButton,
      'products_title': instance.productsTitle,
      'categories_title': instance.categoriesTitle,
      'subcategories_title': instance.subcategoriesTitle,
      'settings_title': instance.settingsTitle,
    };
