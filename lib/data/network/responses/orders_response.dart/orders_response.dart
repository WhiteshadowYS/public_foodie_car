import 'package:foodie_car_template/domain/entity/city/city.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_response.g.dart';
part 'orders_response.freezed.dart';

@freezed
abstract class OrdersResponse with _$OrdersResponse {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory OrdersResponse({
    @JsonKey(name: 'error') String error,
    @JsonKey(name: 'data') List<Order> orders,
  }) = _OrdersResponse;

  factory OrdersResponse.fromJson(Map json) => _$OrdersResponseFromJson(json);
}
