import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_product_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class InfoProductModel implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<Map<String, String>> displayedIn;
  @JsonKey(name: 'files', required: false, nullable: true)
  final List<int> files;

  const InfoProductModel({
    @required this.id,
    @required this.files,
    @required this.displayedIn
  });

  factory InfoProductModel.fromJson(json) => _$InfoProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoProductModelToJson(this);
}
