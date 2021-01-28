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
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'imageUrl') String imageUrl,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    @JsonKey(name: 'start_address') String startAddress,
    @JsonKey(name: 'end_address') String endAddress,
    @JsonKey(name: 'start_phone') String startPhone,
    @JsonKey(name: 'end_phone') String endPhone,
    @JsonKey(name: 'coast') String coast,
  }) = _Order;

  factory Order.fromJson(Map json) => _$OrderFromJson(json);
}
