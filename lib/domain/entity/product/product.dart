import 'package:foodie_client_template/domain/entity/base_image/base_image.dart';
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
    @JsonKey(name: 'category') String category,
    @JsonKey(name: 'price') String price,
    @JsonKey(name: 'weight') num weight,
    @JsonKey(name: 'base_image') BaseImage baseImage,
    @JsonKey(name: 'count', defaultValue: 0) num count,
  }) = _Product;

  factory Product.fromJson(Map json) => _$ProductFromJson(json);
}
