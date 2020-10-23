import 'package:flutter/cupertino.dart';

import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';

part 'file_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [FileModel] is a model that stores data about the file.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [FileModel], implements from the abstract class [IDto].
/// The [FileModel] class has 4 required variables, [id], [type], [file], [languages].
/// Variable [id], catalogs the id of the directory, being unique for each files.
/// [file], catalog the url file that will be displayed in the application on the [FileModel].
/// Variable [type], determines which type of file, video, photo or PDF comes.
/// The parameter [languages], has the type [Map], accepts as the key [Locale],
/// and returns the name and description depending on the Locale to be transferred.
class FileModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'type', required: false, nullable: true)
  final String type;
  @JsonKey(name: 'file', required: false, nullable: true)
  final String file;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const FileModel({
    @required this.id,
    @required this.type,
    @required this.file,
    @required this.languages
  });

  /// Also the class [FileModel], has 2 functions, [nameForLanguage], [descriptionForLanguage]
  /// The [nameForLanguage] function returns the name depending on the language.
  String nameForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_NAME] ?? EMPTY_STRING;
    } catch (e) {
      return KEY_NAME;
    }
  }

  /// The [descriptionForLanguage] function returns the description depending on the language.
  String descriptionForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION] ?? EMPTY_STRING;
    } catch (e) {
      return KEY_DESCRIPTION;
    }
  }
  /// Also the class [FileModel], has [fromJson] and [toJson] to work with the json format.
  /// [FileModel], creates a new exemplar [FileModel], based on json.
  factory FileModel.fromJson(json) => _$FileModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [FileModel].
  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}
