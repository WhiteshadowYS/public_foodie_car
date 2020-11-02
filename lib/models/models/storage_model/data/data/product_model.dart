import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';

part 'product_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [ProductModel] is a model that stores data about the product.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [ProductModel], implements from the abstract class [IDto].
/// The [ProductModel] class has 4 required variables, [id], [imageLink], [galleryImagesLinks], [languages].
/// Variable [id], catalogs the id of the directory, being unique for each product.
/// [image], catalog the url image that will be displayed in the application on the [ProductModel].
/// Variable [cachedImagesGalery], contains a list of url images to be displayed.
/// The parameter [languages], has the type [Map], accepts as the key [Locale],
/// and returns the name, description, description2 and points depending on the Locale to be transferred.
class ProductModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'gallery', required: false, nullable: true)
  final List<String> galleryImagesLinks;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const ProductModel({
    this.id,
    this.imageLink,
    this.galleryImagesLinks,
    this.languages,
  });
  /// Also the class [FileModel], has 4 functions, [titleForLanguage],
  /// [descriptionForLanguage], [description2ForLanguage] and [pointsForLanguage]
  /// The [titleForLanguage] function returns the title depending on the language.
  String titleForLanguage(String langCode) {
    print(languages[langCode][KEY_TITLE]);
    try {
      return languages[langCode][KEY_TITLE] ?? EMPTY_STRING;
    } catch (e) {
      return EMPTY_STRING;
    }
  }

  /// The [descriptionForLanguage] function returns the description depending on the language.
  String descriptionForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION] ?? EMPTY_STRING;
    } catch (e) {
      return EMPTY_STRING;
    }
  }
  /// The [description2ForLanguage] function returns the description2 depending on the language.
  String description2ForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION_2] ?? EMPTY_STRING;
    } catch (e) {
      return EMPTY_STRING;
    }
  }
  /// The [pointsForLanguage] function returns the points depending on the language.
  List<dynamic> pointsForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_POINTS] ?? [];
    } catch (e) {
       return [];
    }
  }

  /// Also the class [ProductModel], has [ProductModel] and [toJson] to work with the json format.
  /// [ProductModel], creates a new exemplar [ProductModel], based on json.
  factory ProductModel.fromJson(json) => _$ProductModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [ProductModel].
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
