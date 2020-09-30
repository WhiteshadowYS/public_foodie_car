import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_data_request_second_data_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GetDataRequestSecondDataDto implements IDto {
  @JsonKey(name: 'catalogs', required: false, nullable: true)
  final List<dynamic> catalogs;
  @JsonKey(name: 'categories', required: false, nullable: true)
  final List<dynamic> categories;
  @JsonKey(name: 'subcategories', required: false, nullable: true)
  final List<dynamic> subcategories;
  @JsonKey(name: 'products', required: false, nullable: true)
  final List<dynamic> products;
  @JsonKey(name: 'files', required: false, nullable: true)
  final List<dynamic> files;

  const GetDataRequestSecondDataDto({
    @required this.catalogs,
    @required this.categories,
    @required this.subcategories,
    @required this.products,
    @required this.files,
  });

  factory GetDataRequestSecondDataDto.fromJson(json) => _$GetDataRequestSecondDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataRequestSecondDataDtoToJson(this);
}
