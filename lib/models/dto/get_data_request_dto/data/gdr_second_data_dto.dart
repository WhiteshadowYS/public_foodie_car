import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_catalog_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_category_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_file_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_product_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_subcategory_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_second_data_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRSecondDataDto implements IDto {
  @JsonKey(name: 'catalogs', required: false, nullable: true)
  final List<GDRCatalogDto> catalogs;
  @JsonKey(name: 'categories', required: false, nullable: true)
  final List<GDRCategoryDto> categories;
  @JsonKey(name: 'subcategories', required: false, nullable: true)
  final List<GDRSubcategoryDto> subcategories;
  @JsonKey(name: 'products', required: false, nullable: true)
  final List<GDRProductDto> products;
  @JsonKey(name: 'files', required: false, nullable: true)
  final List<GDRFileDto> files;

  const GDRSecondDataDto({
    @required this.catalogs,
    @required this.categories,
    @required this.subcategories,
    @required this.products,
    @required this.files,
  });

  factory GDRSecondDataDto.fromJson(json) => _$GDRSecondDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRSecondDataDtoToJson(this);
}
