import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/gdr_data_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/gdr_settings_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';

part 'get_data_request_dto.g.dart';

/// It is dto for main request of application [GetDataRequest].
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
  final GDRSettingsDto settings;
  @JsonKey(name: 'data', required: false, nullable: true)
  final GDRDataDto data;

  const GetDataRequestDto({
    @required this.lastUpdate,
    @required this.partnerLevel,
    @required this.settings,
    @required this.data,
  });

  factory GetDataRequestDto.fromJson(json) => _$GetDataRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataRequestDtoToJson(this);
}
