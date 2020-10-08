import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';

part 'saved_storage_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class SavedStorageModel {
  final String id;
  final String locale;
  final StorageModel storage;

  const SavedStorageModel({
    @required this.id,
    @required this.storage,
    @required this.locale,
  });

  SavedStorageModel copyWith({
    final String id,
    final String locale,
    final StorageModel storage,
  }) {
    return SavedStorageModel(
      id: id ?? this.id,
      locale: locale ?? this.locale,
      storage: storage ?? this.storage,
    );
  }

  factory SavedStorageModel.fromJson(json) => _$SavedStorageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SavedStorageModelToJson(this);
}
