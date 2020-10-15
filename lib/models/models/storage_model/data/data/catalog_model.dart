import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_model.g.dart';

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
    return languages[langCode]['title'];
  }

  String descriptionForLanguage(String langCode) {
    return languages[langCode]['description'];
  }

  factory CatalogModel.fromJson(json) => _$CatalogModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogModelToJson(this);
}
