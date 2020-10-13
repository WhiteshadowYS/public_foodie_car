import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/network/requests/get_check_id_request.dart';

part 'get_check_id_request_dto.g.dart';

/// It is dto for [GetCheckIdRequest].
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GetCheckIdRequestDto implements IDto {
  final int update;

  GetCheckIdRequestDto({
    @required this.update,
  });

  factory GetCheckIdRequestDto.fromJson(json) => _$GetCheckIdRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCheckIdRequestDtoToJson(this);
}
