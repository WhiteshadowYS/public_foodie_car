import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_category_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRCategoryDto implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'languages', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const GDRCategoryDto({
    @required this.id,
    @required this.imageLink,
    @required this.languages
  });

  factory GDRCategoryDto.fromJson(json) => _$GDRCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRCategoryDtoToJson(this);
}
