import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/res/const.dart';

part 'product_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
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

  String titleForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_TITLE] ?? '';
    } catch (e) {
      return EMPTY_STRING;
    }
  }

  String descriptionForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION] ?? '';
    } catch (e) {
      return EMPTY_STRING;
    }
  }

  String description2ForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_DESCRIPTION_2] ?? '';
    } catch (e) {
      return EMPTY_STRING;
    }
  }

  List<dynamic> pointsForLanguage(String langCode) {
    try {
      return languages[langCode][KEY_POINTS] ?? [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  factory ProductModel.fromJson(json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
