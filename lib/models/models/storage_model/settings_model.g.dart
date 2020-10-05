// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('SettingsModel', json, () {
    final val = SettingsModel(
      languages: $checkedConvert(
          json,
          'languages',
          (v) => (v as List)
              ?.map((e) => e == null ? null : LanguageModel.fromJson(e))
              ?.toList()),
      tac: $checkedConvert(json, 'tac', (v) => v as String),
      info: $checkedConvert(
          json, 'info', (v) => v == null ? null : InfoModel.fromJson(v)),
      font: $checkedConvert(json, 'font', (v) => v as String),
      colors: $checkedConvert(
          json, 'color_hex', (v) => v == null ? null : ColorsModel.fromJson(v)),
      footerButtons: $checkedConvert(
          json,
          'footer_buttons',
          (v) => (v as List)
              ?.map((e) => e == null ? null : FooterButtonModel.fromJson(e))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {
    'colors': 'color_hex',
    'footerButtons': 'footer_buttons'
  });
}

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'languages': instance.languages?.map((e) => e?.toJson())?.toList(),
      'tac': instance.tac,
      'info': instance.info?.toJson(),
      'font': instance.font,
      'color_hex': instance.colors?.toJson(),
      'footer_buttons':
          instance.footerButtons?.map((e) => e?.toJson())?.toList(),
    };
