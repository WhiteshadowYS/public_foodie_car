import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/res/const.dart';

part 'file_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
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

  String nameForLanguage(String langCode) {
    try {
      return languages[langCode][NAME] ?? '';
    } catch (e) {
      return NAME;
    }
  }

  String descriptionForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION] ?? '';
    } catch (e) {
      return KEY_DESCRIPTION;
    }
  }

  factory FileModel.fromJson(json) => _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}
