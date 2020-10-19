import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_info_product_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRInfoProductDto implements IDto {
  @JsonKey(name: 'id', required: false, nullable: true)
  final int id;
  @JsonKey(name: 'displayed_in', required: false, nullable: true)
  final List<String> displayedIn;
  @JsonKey(name: 'files', required: false, nullable: true)
  final List<int> files;

  const GDRInfoProductDto({
    @required this.id,
    @required this.files,
    @required this.displayedIn
  });

  factory GDRInfoProductDto.fromJson(json) => _$GDRInfoProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRInfoProductDtoToJson(this);
}
