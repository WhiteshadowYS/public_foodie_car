import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/gdr_info_category_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';

part 'info_catalog_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class InfoCatalogModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<Map<String, String>> displayedIn;
  @JsonKey(name: 'categories', required: false, nullable: true)
  final List<InfoCategoryModel> categories;

  const InfoCatalogModel({
    @required this.id,
    @required this.categories,
    @required this.displayedIn
  });

  factory InfoCatalogModel.fromJson(json) => _$InfoCatalogModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoCatalogModelToJson(this);
}
