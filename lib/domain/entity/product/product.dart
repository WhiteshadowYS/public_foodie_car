import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Product({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'price') num price,
    @JsonKey(name: 'weight') num weight,
    @JsonKey(name: 'String') String imageUrl,
  }) = _Product;

  factory Product.fromJson(Map json) => _$ProductFromJson(json);
}
