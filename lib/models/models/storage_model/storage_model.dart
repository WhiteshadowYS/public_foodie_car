import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/models/models/storage_model/data_model.dart';
import 'package:my_catalog/models/models/storage_model/settings_model.dart';

part 'storage_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [StorageModel] is a model that stores data about the [StorageModel].
/// In the class [StorageModel], store all information.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [StorageModel], implements from the abstract class [IDto].
/// The [StorageModel] class has 3 variables, [partnerLevel], [settings], [data].
/// The [partnerLevel] variable stores information about the package selected by the client.
/// Variable [settings], stores simply [StorageModel].
/// In the variable [data], store all the application form.
class StorageModel implements IDto {
  @JsonKey(name: 'partner_level', required: false, nullable: true)
  final String partnerLevel;
  @JsonKey(name: 'settings', required: false, nullable: true)
  final SettingsModel settings;
  @JsonKey(name: 'data', required: false, nullable: true)
  final DataModel data;

  const StorageModel({
    @required this.partnerLevel,
    @required this.settings,
    @required this.data,
  });

  /// Also the class [StorageModel], has [fromJson] and [toJson] to work with the json format.
  /// [StorageModel], creates a new exemplar [StorageModel], based on json.
  factory StorageModel.fromJson(json) => _$StorageModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [StorageModel].
  Map<String, dynamic> toJson() => _$StorageModelToJson(this);
}
