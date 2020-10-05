// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_footer_button_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRFooterButtonDto _$GDRFooterButtonDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRFooterButtonDto', json, () {
    final val = GDRFooterButtonDto(
      type: $checkedConvert(json, 'type', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as Map<String, dynamic>),
      iconSvg: $checkedConvert(json, 'icon', (v) => v as String),
      list: $checkedConvert(
          json,
          'list',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRFooterButtonDto.fromJson(e))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'iconSvg': 'icon'});
}

Map<String, dynamic> _$GDRFooterButtonDtoToJson(GDRFooterButtonDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'icon': instance.iconSvg,
      'name': instance.name,
      'list': instance.list?.map((e) => e?.toJson())?.toList(),
    };
