// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'orders_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) {
  return _OrdersResponse.fromJson(json);
}

/// @nodoc
class _$OrdersResponseTearOff {
  const _$OrdersResponseTearOff();

// ignore: unused_element
  _OrdersResponse call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Order> orders}) {
    return _OrdersResponse(
      error: error,
      orders: orders,
    );
  }

// ignore: unused_element
  OrdersResponse fromJson(Map<String, Object> json) {
    return OrdersResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $OrdersResponse = _$OrdersResponseTearOff();

/// @nodoc
mixin _$OrdersResponse {
  @JsonKey(name: 'error')
  String get error;
  @JsonKey(name: 'data')
  List<Order> get orders;

  Map<String, dynamic> toJson();
  $OrdersResponseCopyWith<OrdersResponse> get copyWith;
}

/// @nodoc
abstract class $OrdersResponseCopyWith<$Res> {
  factory $OrdersResponseCopyWith(
          OrdersResponse value, $Res Function(OrdersResponse) then) =
      _$OrdersResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Order> orders});
}

/// @nodoc
class _$OrdersResponseCopyWithImpl<$Res>
    implements $OrdersResponseCopyWith<$Res> {
  _$OrdersResponseCopyWithImpl(this._value, this._then);

  final OrdersResponse _value;
  // ignore: unused_field
  final $Res Function(OrdersResponse) _then;

  @override
  $Res call({
    Object error = freezed,
    Object orders = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      orders: orders == freezed ? _value.orders : orders as List<Order>,
    ));
  }
}

/// @nodoc
abstract class _$OrdersResponseCopyWith<$Res>
    implements $OrdersResponseCopyWith<$Res> {
  factory _$OrdersResponseCopyWith(
          _OrdersResponse value, $Res Function(_OrdersResponse) then) =
      __$OrdersResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Order> orders});
}

/// @nodoc
class __$OrdersResponseCopyWithImpl<$Res>
    extends _$OrdersResponseCopyWithImpl<$Res>
    implements _$OrdersResponseCopyWith<$Res> {
  __$OrdersResponseCopyWithImpl(
      _OrdersResponse _value, $Res Function(_OrdersResponse) _then)
      : super(_value, (v) => _then(v as _OrdersResponse));

  @override
  _OrdersResponse get _value => super._value as _OrdersResponse;

  @override
  $Res call({
    Object error = freezed,
    Object orders = freezed,
  }) {
    return _then(_OrdersResponse(
      error: error == freezed ? _value.error : error as String,
      orders: orders == freezed ? _value.orders : orders as List<Order>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_OrdersResponse implements _OrdersResponse {
  const _$_OrdersResponse(
      {@JsonKey(name: 'error') this.error, @JsonKey(name: 'data') this.orders});

  factory _$_OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_OrdersResponseFromJson(json);

  @override
  @JsonKey(name: 'error')
  final String error;
  @override
  @JsonKey(name: 'data')
  final List<Order> orders;

  @override
  String toString() {
    return 'OrdersResponse(error: $error, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrdersResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.orders, orders) ||
                const DeepCollectionEquality().equals(other.orders, orders)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(orders);

  @override
  _$OrdersResponseCopyWith<_OrdersResponse> get copyWith =>
      __$OrdersResponseCopyWithImpl<_OrdersResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrdersResponseToJson(this);
  }
}

abstract class _OrdersResponse implements OrdersResponse {
  const factory _OrdersResponse(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Order> orders}) = _$_OrdersResponse;

  factory _OrdersResponse.fromJson(Map<String, dynamic> json) =
      _$_OrdersResponse.fromJson;

  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(name: 'data')
  List<Order> get orders;
  @override
  _$OrdersResponseCopyWith<_OrdersResponse> get copyWith;
}
