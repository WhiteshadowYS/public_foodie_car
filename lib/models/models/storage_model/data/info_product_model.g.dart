// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoProductModel _$InfoProductModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('InfoProductModel', json, () {
    final val = InfoProductModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      files: $checkedConvert(
          json, 'files', (v) => (v as List)?.map((e) => e as int)?.toList()),
      displayedIn: $checkedConvert(
          json,
          'displayed_in',
          (v) => (v as List)
              ?.map((e) => (e as Map<String, dynamic>)?.map(
                    (k, e) => MapEntry(k, e as String),
                  ))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'displayedIn': 'displayed_in'});
}

Map<String, dynamic> _$InfoProductModelToJson(InfoProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'files': instance.files,
    };
