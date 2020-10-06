import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saved_storage_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class SavedStorageModel {
  final String locale;
  final StorageModel storage;

  const SavedStorageModel({
    @required this.storage,
    @required this.locale,
  });

  factory SavedStorageModel.fromJson(json) => _$SavedStorageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedStorageModelToJson(this);
}
