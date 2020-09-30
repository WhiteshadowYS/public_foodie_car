import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_data_request_language_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GetDataRequestLanguageDto implements IDto {
  @JsonKey(name: 'name', required: false, nullable: true)
  final String name;
  @JsonKey(name: 'code', required: false, nullable: true)
  final String code;
  @JsonKey(name: 'flag', required: false, nullable: true)
  final String flag;
  @JsonKey(name: 'direction', required: false, nullable: true)
  final String direction;
  @JsonKey(name: 'is_default', required: false, nullable: true)
  final bool isDefault;

  const GetDataRequestLanguageDto({
    @required this.name,
    @required this.code,
    @required this.flag,
    @required this.direction,
    @required this.isDefault,
  });

  factory GetDataRequestLanguageDto.fromJson(json) => _$GetDataRequestLanguageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataRequestLanguageDtoToJson(this);
}