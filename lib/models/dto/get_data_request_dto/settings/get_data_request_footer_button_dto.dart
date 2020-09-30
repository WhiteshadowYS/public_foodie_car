import 'package:flutter/material.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_data_request_footer_button_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GetDataRequestFooterButtonDto implements IDto {
  @JsonKey(name: 'type', required: false, nullable: true)
  final String type;
  @JsonKey(name: 'icon', required: false, nullable: true)
  final String iconSvg;
  @JsonKey(name: 'name', required: false, nullable: true)
  final Map<String, dynamic> name;
  @JsonKey(name: 'list', required: false, nullable: true)
  final List<GetDataRequestFooterButtonDto> list;

  const GetDataRequestFooterButtonDto({
    @required this.type,
    @required this.name,
    @required this.iconSvg,
    @required this.list,
  });

  factory GetDataRequestFooterButtonDto.fromJson(json) => _$GetDataRequestFooterButtonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataRequestFooterButtonDtoToJson(this);
}
