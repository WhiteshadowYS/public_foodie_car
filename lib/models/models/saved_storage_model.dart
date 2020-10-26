import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/models/models/storage_model/storage_model.dart';

part 'saved_storage_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)

/// The class [SavedStorageModel] is a model that stores data about the [SavedStorageModel].
/// The purpose of the [SavedStorageModel] class is to store all information including, current version, storage and locale.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [SavedStorageModel], implements from the abstract class [IDto].
/// The [SavedStorageModel] class has 4 variables, [update], [id], [locale], [storage]+.
/// In the [update] variable, store the current version of the application.
/// Variable [id], subcategory the id of the directory, being unique for each subcategory.
/// In the [locale] variable, store the current [locale].
/// In the variable [storage], store StorageModel.
class SavedStorageModel {
  final int update;
  final int id;
  final String locale;
  final StorageModel storage;

  const SavedStorageModel({
    @required this.update,
    @required this.id,
    @required this.storage,
    @required this.locale,
  });

  ///The class [SavedStorageModel], overrides, the standard copyWith method.
  SavedStorageModel copyWith({
    final int id,
    final String locale,
    final int update,
    final StorageModel storage,
  }) {
    return SavedStorageModel(
      id: id ?? this.id,
      locale: locale ?? this.locale,
      update: update ?? this.update,
      storage: storage ?? this.storage,
    );
  }

  /// Also the class [SavedStorageModel], has [fromJson] and [toJson] to work with the json format.
  /// [SavedStorageModel], creates a new exemplar [SavedStorageModel], based on json.
  factory SavedStorageModel.fromJson(json) => _$SavedStorageModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [SavedStorageModel].
  Map<String, dynamic> toJson() => _$SavedStorageModelToJson(this);
}
