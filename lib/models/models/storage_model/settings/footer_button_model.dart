import 'package:flutter/material.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'footer_button_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class FooterButtonModel implements IDto {
  @JsonKey(name: 'type', required: false, nullable: true)
  final String type;
  @JsonKey(name: 'icon', required: false, nullable: true)
  final String iconSvg;
  @JsonKey(name: 'name', required: false, nullable: true)
  final Map<String, dynamic> name;
  @JsonKey(name: 'list', required: false, nullable: true)
  final List<FooterButtonModel> list;

  const FooterButtonModel({
    @required this.type,
    @required this.name,
    @required this.iconSvg,
    @required this.list,
  });

  factory FooterButtonModel.fromJson(json) => _$FooterButtonModelFromJson(json);

  Map<String, dynamic> toJson() => _$FooterButtonModelToJson(this);
}
