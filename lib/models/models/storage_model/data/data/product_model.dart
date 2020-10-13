import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

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
  @JsonKey(name: 'files', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const ProductModel({
    this.id,
    this.imageLink,
    this.galleryImagesLinks,
    this.languages,
  });

  factory ProductModel.fromJson(json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
