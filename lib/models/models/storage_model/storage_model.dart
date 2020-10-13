import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/data_model.dart';
import 'package:my_catalog/models/models/storage_model/settings_model.dart';

part 'storage_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
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

  factory StorageModel.fromJson(json) => _$StorageModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorageModelToJson(this);
}
