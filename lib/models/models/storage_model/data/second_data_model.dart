import 'package:flutter/material.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_catalog_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_category_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_file_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_product_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/data/data/gdr_subcategory_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';

part 'second_data_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
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

  factory SecondDataModel.fromJson(json) => _$SecondDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SecondDataModelToJson(this);
}
