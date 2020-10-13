import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_product_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRProductDto implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'gallery', required: false, nullable: true)
  final List<String> galleryImagesLinks;
  @JsonKey(name: 'files', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const GDRProductDto({
    this.id,
    this.imageLink,
    this.galleryImagesLinks,
    this.languages,
  });

  factory GDRProductDto.fromJson(json) => _$GDRProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRProductDtoToJson(this);
}
