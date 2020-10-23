import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/info_product_model.dart';

part 'info_subcategory_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [InfoSubcategoryModel] is a model that stores data about the [InfoSubcategoryModel].
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [InfoSubcategoryModel], implements from the abstract class [IDto].
/// The [InfoSubcategoryModel] class has 3 required variables, [id], [displayedIn], [products].
/// Variable [id], [subcategories] the id of the directory, being unique for each [InfoSubcategoryModel].
/// [displayedIn], returns the languages in which the [subcategories] will be displayed.
/// To obtain all [products] that relate to the selected [subcategories], use the variable [products].
class InfoSubcategoryModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<String> displayedIn;
  @JsonKey(name: 'products', required: false, nullable: true)
  final List<InfoProductModel> products;

  const InfoSubcategoryModel({
    @required this.id,
    @required this.products,
    @required this.displayedIn,
  });

  /// Also the class [InfoSubcategoryModel], has [fromJson] and [toJson] to work with the json format.
  /// [InfoSubcategoryModel], creates a new exemplar [InfoSubcategoryModel], based on json.
  factory InfoSubcategoryModel.fromJson(json) => _$InfoSubcategoryModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [InfoSubcategoryModel].
  Map<String, dynamic> toJson() => _$InfoSubcategoryModelToJson(this);
}
