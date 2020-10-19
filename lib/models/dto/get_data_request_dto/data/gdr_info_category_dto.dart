import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/gdr_info_subcategory_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_info_category_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRInfoCategoryDto implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<String> displayedIn;
  @JsonKey(name: 'sub_categories', required: false, nullable: true)
  final List<GDRInfoSubcategoryDto> subcategories;

  const GDRInfoCategoryDto({
    @required this.id,
    @required this.subcategories,
    @required this.displayedIn
  });

  factory GDRInfoCategoryDto.fromJson(json) => _$GDRInfoCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRInfoCategoryDtoToJson(this);
}
