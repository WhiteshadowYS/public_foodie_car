import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';

part 'category_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [CategoryModel] is a model that stores data about the category.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [CategoryModel], implements from the abstract class [IDto].
/// The [CategoryModel] class has 3 required variables, [id], [imageLink], [languages].
/// Variable [id], category the id of the directory, being unique for each catalogs.
/// [image], category the url image that will be displayed in the application on the [CategoryModel].
/// The parameter [languages], has the type [Map], accepts as the key [Locale],
/// and returns the title depending on the Locale to be transferred.
class CategoryModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const CategoryModel({
    @required this.id,
    @required this.imageLink,
    @required this.languages
  });
  /// Also the class [CategoryModel], has 1 functions, [titleForLanguage]
  /// The [titleForLanguage] function returns the name depending on the language.
  String titleForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_TITLE] ?? EMPTY_STRING;
    } catch (e) {
      return KEY_TITLE;
    }
  }
  /// Also the class [CategoryModel], has [fromJson] and [toJson] to work with the json format.
  /// [CategoryModel], creates a new exemplar [CategoryModel], based on json.
  factory CategoryModel.fromJson(json) => _$CategoryModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [CategoryModel].
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
