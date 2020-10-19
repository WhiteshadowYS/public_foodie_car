import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_subcategory_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRSubcategoryDto implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const GDRSubcategoryDto({
    @required this.id,
    @required this.imageLink,
    @required this.languages
  });

  factory GDRSubcategoryDto.fromJson(json) => _$GDRSubcategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRSubcategoryDtoToJson(this);
}
