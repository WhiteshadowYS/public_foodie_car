import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/second_data_model.dart';

part 'data_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [DataModel] is a model that stores data about the [DataModel].
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [DataModel], implements from the abstract class [IDto].
/// The [DataModel] class has 2 variables, [hierarchy], [data].
/// In the variable [hierarchy], store all information and the disposition and relationship between the data.
/// [data], stores the whole value.
class DataModel implements IDto {
  @JsonKey(name: 'hierarchy', required: false, nullable: true)
  final List<InfoCatalogModel> hierarchy;
  @JsonKey(name: 'data', required: false, nullable: true)
  final SecondDataModel data;

  const DataModel({
    @required this.hierarchy,
    @required this.data,
  });

  /// Also the class [SecondDataModel], has [fromJson] and [toJson] to work with the json format.
  /// [SecondDataModel], creates a new exemplar [SecondDataModel], based on json.
  factory DataModel.fromJson(json) => _$DataModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [SecondDataModel].
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}