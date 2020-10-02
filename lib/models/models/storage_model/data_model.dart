import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/second_data_model.dart';

part 'data_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class DataModel implements IDto {
  @JsonKey(name: 'hierarchy', required: false, nullable: true)
  final List<InfoCatalogModel> hierarchy;
  @JsonKey(name: 'data', required: false, nullable: true)
  final SecondDataModel data;

  const DataModel({
    @required this.hierarchy,
    @required this.data,
  });

  factory DataModel.fromJson(json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}