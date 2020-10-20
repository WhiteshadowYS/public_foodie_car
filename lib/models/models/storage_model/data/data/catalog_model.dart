import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/res/const.dart';

part 'catalog_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class CatalogModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const CatalogModel({
    @required this.id,
    @required this.imageLink,
    @required this.languages
  });

  String titleForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_TITLE] ?? '';
    } catch (e) {
      return KEY_TITLE;
    }
  }

  String descriptionForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION] ?? '';
    } catch (e) {
      return KEY_DESCRIPTION;
    }
  }

  factory CatalogModel.fromJson(json) => _$CatalogModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogModelToJson(this);
}
