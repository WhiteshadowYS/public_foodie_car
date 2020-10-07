import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class FileModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'type', required: false, nullable: true)
  final String type;
  @JsonKey(name: 'image', required: false, nullable: true)
  final String imageLink;
  @JsonKey(name: 'sub_categories', required: false, nullable: true)
  final Map<String, dynamic> languages;

  const FileModel({
    @required this.id,
    @required this.type,
    @required this.imageLink,
    @required this.languages
  });

  factory FileModel.fromJson(json) => _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}