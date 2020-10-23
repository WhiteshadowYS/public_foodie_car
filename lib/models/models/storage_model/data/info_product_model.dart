import 'package:flutter/cupertino.dart';

import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/models/interfaces/i_dto.dart';

part 'info_product_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [InfoProductModel] is a model that stores data about the [InfoProductModel].
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [InfoProductModel], implements from the abstract class [IDto].
/// The [InfoProductModel] class has 3 required variables, [id], [displayedIn], [files].
/// Variable [id], [product] the id of the directory, being unique for each [InfoProductModel].
/// [displayedIn], returns the languages in which the [category] will be displayed.
/// To obtain all [files] that relate to the selected [product], use the variable [files].
class InfoProductModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<String> displayedIn;
  @JsonKey(name: 'files', required: false, nullable: true)
  final List<int> files;

  const InfoProductModel({
    @required this.id,
    @required this.files,
    @required this.displayedIn
  });

  /// Also the class [InfoProductModel], has [fromJson] and [toJson] to work with the json format.
  /// [InfoProductModel], creates a new exemplar [InfoCategoryModel], based on json.
  factory InfoProductModel.fromJson(json) => _$InfoProductModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [InfoProductModel].
  Map<String, dynamic> toJson() => _$InfoProductModelToJson(this);
}
