import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/gdr_info_category_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_info_catalog_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRInfoCatalogDto implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<String> displayedIn;
  @JsonKey(name: 'categories', required: false, nullable: true)
  final List<GDRInfoCategoryDto> categories;

  const GDRInfoCatalogDto({
    @required this.id,
    @required this.categories,
    @required this.displayedIn
  });

  factory GDRInfoCatalogDto.fromJson(json) => _$GDRInfoCatalogDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRInfoCatalogDtoToJson(this);
}
