import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_data_request_data_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GetDataRequestDataDto implements IDto {
  @JsonKey(name: 'hierarchy', required: false, nullable: true)
  final List<dynamic> hierarchy ;
  @JsonKey(name: 'data', required: false, nullable: true)
  final List<dynamic> data;

  const GetDataRequestDataDto({
    @required this.hierarchy,
    @required this.data,
  });

  factory GetDataRequestDataDto.fromJson(json) => _$GetDataRequestDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataRequestDataDtoToJson(this);
}