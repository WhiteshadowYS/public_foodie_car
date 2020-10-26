import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/models/interfaces/i_model.dart';

part 'storage_status_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [StorageStatusModel] is a model that stores data about the [StorageStatusModel].
/// Assigning the class [StorageStatusModel] - store all about the current version.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [StorageStatusModel], implements from the abstract class [IDto].
/// The [StorageStatusModel] class has 4 variables, [id], [update].
/// Variable [id], subcategory the id of the directory, being unique for each subcategory.
/// In the [update] variable, store the current version of the application.
class StorageStatusModel implements IModel {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'update', required: false, nullable: true)
  final int update;

  StorageStatusModel({
    @required this.id,
    @required this.update,
  });

  /// Also the class [StorageStatusModel], has [fromJson] and [toJson] to work with the json format.
  /// [StorageStatusModel], creates a new exemplar [StorageStatusModel], based on json.
  factory StorageStatusModel.fromJson(json) => _$StorageStatusModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [StorageStatusModel].
  Map<String, dynamic> toJson() => _$StorageStatusModelToJson(this);
}
