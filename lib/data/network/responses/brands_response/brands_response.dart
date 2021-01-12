import 'package:foodie_client_template/domain/entity/brand/brand.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands_response.g.dart';
part 'brands_response.freezed.dart';

@freezed
abstract class BrandsResponse with _$BrandsResponse {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory BrandsResponse({
    @JsonKey(name: 'error') String error,
    @JsonKey(name: 'data') List<Brand> brands,
  }) = _BrandsResponse;

  factory BrandsResponse.fromJson(Map json) => _$BrandsResponseFromJson(json);
}
