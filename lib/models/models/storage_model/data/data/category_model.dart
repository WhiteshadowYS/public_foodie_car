import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class CategoryModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'sub_categories', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const CategoryModel({
    @required this.id,
    @required this.imageLink,
    @required this.languages
  });

  factory CategoryModel.fromJson(json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
