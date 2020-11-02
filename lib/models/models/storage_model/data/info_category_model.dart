import 'package:flutter/cupertino.dart';

import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';

part 'info_category_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [InfoCategoryModel] is a model that stores data about the [infoCategoryModel].
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [InfoCategoryModel], implements from the abstract class [IDto].
/// The [InfoCategoryModel] class has 3 required variables, [id], [displayedIn], [subcategories].
/// Variable [id], [category] the id of the directory, being unique for each [InfoCategoryModel].
/// [displayedIn], returns the languages in which the [category] will be displayed.
/// To obtain all [subcategories] that relate to the selected [category], use the variable [subcategories].
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

  /// Also the class [InfoCategoryModel], has [fromJson] and [toJson] to work with the json format.
  /// [InfoCategoryModel], creates a new exemplar [InfoCategoryModel], based on json.
  factory InfoCategoryModel.fromJson(json) => _$InfoCategoryModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [InfoCategoryModel].
  Map<String, dynamic> toJson() => _$InfoCategoryModelToJson(this);
}
