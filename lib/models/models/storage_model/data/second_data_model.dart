import 'package:flutter/material.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';

part 'second_data_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)

/// The class [SecondDataModel] is a model that stores data about the [SecondDataModel].
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [SecondDataModel], implements from the abstract class [IDto].
/// The [SecondDataModel] class has 5 required variables, [catalogs], [categories], [subcategories],[products], [files].
/// To obtain all [catalogs] that relate to the selected [SecondDataModel], use the variable [catalogs].
/// To obtain all [categories] that relate to the selected [SecondDataModel], use the variable [categories].
/// To obtain all [subcategories] that relate to the selected [SecondDataModel], use the variable [subcategories].
/// To obtain all [products] that relate to the selected [SecondDataModel], use the variable [products].
/// To obtain all [files] that relate to the selected [SecondDataModel], use the variable [files].
class SecondDataModel implements IDto {
  @JsonKey(name: 'catalogs', required: false, nullable: true)
  final List<CatalogModel> catalogs;
  @JsonKey(name: 'categories', required: false, nullable: true)
  final List<CategoryModel> categories;
  @JsonKey(name: 'subcategories', required: false, nullable: true)
  final List<SubcategoryModel> subcategories;
  @JsonKey(name: 'products', required: false, nullable: true)
  final List<ProductModel> products;
  @JsonKey(name: 'files', required: false, nullable: true)
  final List<FileModel> files;

  const SecondDataModel({
    @required this.catalogs,
    @required this.categories,
    @required this.subcategories,
    @required this.products,
    @required this.files,
  });
  /// Also the class [SecondDataModel], has [fromJson] and [toJson] to work with the json format.
  /// [SecondDataModel], creates a new exemplar [SecondDataModel], based on json.
  factory SecondDataModel.fromJson(json) => _$SecondDataModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [SecondDataModel].
  Map<String, dynamic> toJson() => _$SecondDataModelToJson(this);
}
