// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BaseImage _$_$_BaseImageFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_BaseImage', json, () {
    final val = _$_BaseImage(
      smallImageUrl:
          $checkedConvert(json, 'small_image_url', (v) => v as String),
      mediumImageUrl:
          $checkedConvert(json, 'medium_image_url', (v) => v as String),
      largeImageUrl:
          $checkedConvert(json, 'large_image_url', (v) => v as String),
      originalImageUrl:
          $checkedConvert(json, 'original_image_url', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'smallImageUrl': 'small_image_url',
    'mediumImageUrl': 'medium_image_url',
    'largeImageUrl': 'large_image_url',
    'originalImageUrl': 'original_image_url'
  });
}

Map<String, dynamic> _$_$_BaseImageToJson(_$_BaseImage instance) =>
    <String, dynamic>{
      'small_image_url': instance.smallImageUrl,
      'medium_image_url': instance.mediumImageUrl,
      'large_image_url': instance.largeImageUrl,
      'original_image_url': instance.originalImageUrl,
    };
