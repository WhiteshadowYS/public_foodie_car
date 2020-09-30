// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_footer_button_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestFooterButtonDto _$GetDataRequestFooterButtonDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestFooterButtonDto', json, () {
    final val = GetDataRequestFooterButtonDto(
      type: $checkedConvert(json, 'type', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as Map<String, dynamic>),
      iconSvg: $checkedConvert(json, 'icon', (v) => v as String),
      list: $checkedConvert(
          json,
          'list',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : GetDataRequestFooterButtonDto.fromJson(e))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'iconSvg': 'icon'});
}

Map<String, dynamic> _$GetDataRequestFooterButtonDtoToJson(
        GetDataRequestFooterButtonDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'icon': instance.iconSvg,
      'name': instance.name,
      'list': instance.list?.map((e) => e?.toJson())?.toList(),
    };
