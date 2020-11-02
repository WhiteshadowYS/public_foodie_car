import 'package:flutter/cupertino.dart';

import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';

part 'info_catalog_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [InfoCatalogModel] is a model that stores data about the infoCatalogModel.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [InfoCatalogModel], implements from the abstract class [IDto].
/// The [InfoCatalogModel] class has 3 required variables, [id], [displayedIn], [categories].
/// Variable [id], subcategory the id of the directory, being unique for each infoCatalog.
/// [displayedIn], returns the languages in which the catalogs will be displayed.
/// To obtain all [categories] that relate to the selected [catalog], use the variable [categories].
class InfoCatalogModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<String> displayedIn;
  @JsonKey(name: 'categories', required: false, nullable: true)
  final List<InfoCategoryModel> categories;

  const InfoCatalogModel({
    @required this.id,
    @required this.categories,
    @required this.displayedIn
  });

  /// Also the class [InfoCatalogModel], has [fromJson] and [toJson] to work with the json format.
  /// [InfoCatalogModel], creates a new exemplar [InfoCatalogModel], based on json.
  factory InfoCatalogModel.fromJson(json) => _$InfoCatalogModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [InfoCatalogModel].
  Map<String, dynamic> toJson() => _$InfoCatalogModelToJson(this);
}
