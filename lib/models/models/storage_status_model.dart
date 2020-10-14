import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/interfaces/i_model.dart';

part 'storage_status_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class StorageStatusModel implements IModel {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'update', required: false, nullable: true)
  final int update;

  StorageStatusModel({
    @required this.id,
    @required this.update,
  });

  factory StorageStatusModel.fromJson(json) => _$StorageStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorageStatusModelToJson(this);
}
