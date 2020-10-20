import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';

part 'info_category_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class InfoCategoryModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<String> displayedIn;
  @JsonKey(name: 'sub_categories', required: false, nullable: true)
  final List<InfoSubcategoryModel> subcategories;

  const InfoCategoryModel({
    @required this.id,
    @required this.subcategories,
    @required this.displayedIn
  });

  factory InfoCategoryModel.fromJson(json) => _$InfoCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoCategoryModelToJson(this);
}
