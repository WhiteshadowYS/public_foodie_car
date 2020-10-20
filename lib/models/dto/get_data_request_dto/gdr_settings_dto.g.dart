// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRSettingsDto _$GDRSettingsDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRSettingsDto', json, () {
    final val = GDRSettingsDto(
      languages: $checkedConvert(
          json,
          'languages',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRLanguageDto.fromJson(e))
              ?.toList()),
      tac: $checkedConvert(json, 'tac', (v) => v as String),
      info: $checkedConvert(
          json, 'info', (v) => v == null ? null : GDRInfoDto.fromJson(v)),
      font: $checkedConvert(json, 'font', (v) => v as String),
      colors: $checkedConvert(json, 'color_hex',
          (v) => v == null ? null : GDRColorsDto.fromJson(v)),
      languageData: $checkedConvert(json, 'language_data',
          (v) => v == null ? null : GDRLanguageDataDto.fromJson(v)),
      footerButtons: $checkedConvert(
          json,
          'footer_buttons',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRFooterButtonDto.fromJson(e))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {
    'colors': 'color_hex',
    'languageData': 'language_data',
    'footerButtons': 'footer_buttons'
  });
}

Map<String, dynamic> _$GDRSettingsDtoToJson(GDRSettingsDto instance) =>
    <String, dynamic>{
      'languages': instance.languages?.map((e) => e?.toJson())?.toList(),
      'language_data': instance.languageData?.toJson(),
      'tac': instance.tac,
      'info': instance.info?.toJson(),
      'font': instance.font,
      'color_hex': instance.colors?.toJson(),
      'footer_buttons':
          instance.footerButtons?.map((e) => e?.toJson())?.toList(),
    };
