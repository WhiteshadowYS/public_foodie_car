import 'package:flutter/material.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_info_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRInfoDto implements IDto {
  @JsonKey(name: 'logo_img', required: false, nullable: true)
  final String logoImage;
  @JsonKey(name: 'title', required: false, nullable: true)
  final String title;
  @JsonKey(name: 'text', required: false, nullable: true)
  final String text;

  const GDRInfoDto({
    @required this.logoImage,
    @required this.text,
    @required this.title,
  });

  factory GDRInfoDto.fromJson(json) => _$GDRInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRInfoDtoToJson(this);
}
