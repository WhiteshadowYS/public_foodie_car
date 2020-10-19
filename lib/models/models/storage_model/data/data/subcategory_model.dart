import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/res/const.dart';

part 'subcategory_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class SubcategoryModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const SubcategoryModel({
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

  factory SubcategoryModel.fromJson(json) => _$SubcategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryModelToJson(this);
}
