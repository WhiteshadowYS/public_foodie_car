import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/gdr_info_product_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_info_subcategory_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRInfoSubcategoryDto implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<Map<String, String>> displayedIn;
  @JsonKey(name: 'products', required: false, nullable: true)
  final List<GDRInfoProductDto> products;

  const GDRInfoSubcategoryDto({
    @required this.id,
    @required this.products,
    @required this.displayedIn,
  });

  factory GDRInfoSubcategoryDto.fromJson(json) => _$GDRInfoSubcategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRInfoSubcategoryDtoToJson(this);
}
