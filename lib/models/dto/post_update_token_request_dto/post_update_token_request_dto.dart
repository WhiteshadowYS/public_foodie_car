import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/network/requests/post_update_token_request.dart';

part 'post_update_token_request_dto.g.dart';

/// It is dto for [PostUpdateTokenRequest].
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class PostUpdateTokenRequestDto implements IDto {
  final String status;

  PostUpdateTokenRequestDto({
    @required this.status,
  });

  factory PostUpdateTokenRequestDto.fromJson(json) => _$PostUpdateTokenRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostUpdateTokenRequestDtoToJson(this);
}
