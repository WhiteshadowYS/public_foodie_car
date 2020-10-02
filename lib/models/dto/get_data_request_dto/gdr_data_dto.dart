import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/gdr_info_catalog_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/gdr_second_data_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_data_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRDataDto implements IDto {
  @JsonKey(name: 'hierarchy', required: false, nullable: true)
  final List<GDRInfoCatalogDto> hierarchy;
  @JsonKey(name: 'data', required: false, nullable: true)
  final GDRSecondDataDto data;

  const GDRDataDto({
    @required this.hierarchy,
    @required this.data,
  });

  factory GDRDataDto.fromJson(json) => _$GDRDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRDataDtoToJson(this);
}
