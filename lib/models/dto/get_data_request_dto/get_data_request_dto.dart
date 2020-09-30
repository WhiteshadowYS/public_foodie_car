import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_data_request_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GetDataRequestDto implements IDto {
  @JsonKey(name: 'last_update', required: false, nullable: true)
  final int lastUpdate;
  @JsonKey(name: 'partner_level', required: false, nullable: true)
  final String partnerLevel;
  @JsonKey(name: 'settings', required: false, nullable: true)
  final String settings;
  @JsonKey(name: 'data', required: false, nullable: true)
  final String data;

  const GetDataRequestDto({
    @required this.lastUpdate,
    @required this.partnerLevel,
    @required this.settings,
    @required this.data,
  });

  factory GetDataRequestDto.fromJson(json) => _$GetDataRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataRequestDtoToJson(this);
}