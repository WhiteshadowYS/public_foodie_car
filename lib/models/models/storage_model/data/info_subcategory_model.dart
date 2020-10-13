import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/info_product_model.dart';

part 'info_subcategory_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class InfoSubcategoryModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<Map<String, String>> displayedIn;
  @JsonKey(name: 'products', required: false, nullable: true)
  final List<InfoProductModel> products;

  const InfoSubcategoryModel({
    @required this.id,
    @required this.products,
    @required this.displayedIn,
  });

  factory InfoSubcategoryModel.fromJson(json) => _$InfoSubcategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoSubcategoryModelToJson(this);
}
