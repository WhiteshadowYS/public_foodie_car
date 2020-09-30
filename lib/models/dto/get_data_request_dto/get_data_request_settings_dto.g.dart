// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestSettingsDto _$GetDataRequestSettingsDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestSettingsDto', json, () {
    final val = GetDataRequestSettingsDto(
      languages: $checkedConvert(
          json,
          'languages',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : GetDataRequestLanguageDto.fromJson(e))
              ?.toList()),
      tac: $checkedConvert(json, 'tac', (v) => v as String),
      info: $checkedConvert(json, 'info',
          (v) => v == null ? null : GetDataRequestInfoDto.fromJson(v)),
      font: $checkedConvert(json, 'font', (v) => v as String),
      colors: $checkedConvert(json, 'color_hex',
          (v) => v == null ? null : GetDataRequestColorsDto.fromJson(v)),
      footerButtons:
          $checkedConvert(json, 'footer_buttons', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'colors': 'color_hex',
    'footerButtons': 'footer_buttons'
  });
}

Map<String, dynamic> _$GetDataRequestSettingsDtoToJson(
        GetDataRequestSettingsDto instance) =>
    <String, dynamic>{
      'languages': instance.languages?.map((e) => e?.toJson())?.toList(),
      'tac': instance.tac,
      'info': instance.info?.toJson(),
      'font': instance.font,
      'color_hex': instance.colors?.toJson(),
      'footer_buttons': instance.footerButtons,
    };
