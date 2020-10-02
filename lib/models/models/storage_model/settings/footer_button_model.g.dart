// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_button_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FooterButtonModel _$FooterButtonModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('FooterButtonModel', json, () {
    final val = FooterButtonModel(
      type: $checkedConvert(json, 'type', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as Map<String, dynamic>),
      iconSvg: $checkedConvert(json, 'icon', (v) => v as String),
      list: $checkedConvert(
          json,
          'list',
          (v) => (v as List)
              ?.map((e) => e == null ? null : FooterButtonModel.fromJson(e))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'iconSvg': 'icon'});
}

Map<String, dynamic> _$FooterButtonModelToJson(FooterButtonModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'icon': instance.iconSvg,
      'name': instance.name,
      'list': instance.list?.map((e) => e?.toJson())?.toList(),
    };
