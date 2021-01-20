import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_response.g.dart';
part 'products_response.freezed.dart';

@freezed
abstract class ProductsResponse with _$ProductsResponse {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory ProductsResponse({
    @JsonKey(name: 'error') String error,
    @JsonKey(name: 'data') List<Product> products,
  }) = _ProductsResponse;

  factory ProductsResponse.fromJson(Map json) => _$ProductsResponseFromJson(json);
}
