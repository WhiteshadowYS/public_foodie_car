import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';

part 'catalog_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [CatalogModel] is a model that stores data about the catalog.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [CatalogModel], implements from the abstract class [IDto].
/// The [CatalogModel] class has 3 required variables, [id], [imageLink], [languages].
/// Variable [id], catalogs the id of the directory, being unique for each catalogs.
/// [image], catalog the url image that will be displayed in the application on the [CatalogsPage].
/// The parameter [languages], has the type [Map], accepts as the key [Locale],
/// and returns the name and description depending on the Locale to be transferred.
class CatalogModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const CatalogModel({@required this.id, @required this.imageLink, @required this.languages});

  /// Also the class [CatalogModel], has 2 functions, [titleForLanguage], [descriptionForLanguage]
  /// The [titleForLanguage] function returns the name depending on the language.
  String titleForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_TITLE] ?? EMPTY_STRING;
    } catch (error) {
      return KEY_TITLE;
    }
  }

  /// The [descriptionForLanguage] function returns the description depending on the language.
  String descriptionForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION] ?? EMPTY_STRING;
    } catch (error) {
      return KEY_DESCRIPTION;
    }
  }

  /// Also the class [CatalogModel], has [fromJson] and [toJson] to work with the json format.
  /// [fromJson], creates a new exemplar [CatalogModel], based on json.
  factory CatalogModel.fromJson(json) => _$CatalogModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [CatalogModel].
  Map<String, dynamic> toJson() => _$CatalogModelToJson(this);
}
