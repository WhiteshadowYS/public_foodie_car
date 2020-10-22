// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_update_token_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUpdateTokenRequestDto _$PostUpdateTokenRequestDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('PostUpdateTokenRequestDto', json, () {
    final val = PostUpdateTokenRequestDto(
      status: $checkedConvert(json, 'status', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$PostUpdateTokenRequestDtoToJson(
        PostUpdateTokenRequestDto instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
