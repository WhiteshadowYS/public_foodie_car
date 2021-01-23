import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.g.dart';
part 'order.freezed.dart';

@freezed
abstract class Order with _$Order {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Order({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'prducts') List<Product> products,
  }) = _Order;

  factory Order.fromJson(Map json) => _$OrderFromJson(json);
}
