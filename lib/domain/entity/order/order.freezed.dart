// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
class _$OrderTearOff {
  const _$OrderTearOff();

// ignore: unused_element
  _Order call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      @JsonKey(name: 'start_address') String startAddress,
      @JsonKey(name: 'end_address') String endAddress,
      @JsonKey(name: 'start_phone') String startPhone,
      @JsonKey(name: 'end_phone') String endPhone,
      @JsonKey(name: 'coast') String coast}) {
    return _Order(
      id: id,
      name: name,
      imageUrl: imageUrl,
      status: status,
      startTime: startTime,
      endTime: endTime,
      startAddress: startAddress,
      endAddress: endAddress,
      startPhone: startPhone,
      endPhone: endPhone,
      coast: coast,
    );
  }

// ignore: unused_element
  Order fromJson(Map<String, Object> json) {
    return Order.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Order = _$OrderTearOff();

/// @nodoc
mixin _$Order {
  @JsonKey(name: 'id')
  num get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'imageUrl')
  String get imageUrl;
  @JsonKey(name: 'status')
  String get status;
  @JsonKey(name: 'start_time')
  String get startTime;
  @JsonKey(name: 'end_time')
  String get endTime;
  @JsonKey(name: 'start_address')
  String get startAddress;
  @JsonKey(name: 'end_address')
  String get endAddress;
  @JsonKey(name: 'start_phone')
  String get startPhone;
  @JsonKey(name: 'end_phone')
  String get endPhone;
  @JsonKey(name: 'coast')
  String get coast;

  Map<String, dynamic> toJson();
  $OrderCopyWith<Order> get copyWith;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      @JsonKey(name: 'start_address') String startAddress,
      @JsonKey(name: 'end_address') String endAddress,
      @JsonKey(name: 'start_phone') String startPhone,
      @JsonKey(name: 'end_phone') String endPhone,
      @JsonKey(name: 'coast') String coast});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object imageUrl = freezed,
    Object status = freezed,
    Object startTime = freezed,
    Object endTime = freezed,
    Object startAddress = freezed,
    Object endAddress = freezed,
    Object startPhone = freezed,
    Object endPhone = freezed,
    Object coast = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as num,
      name: name == freezed ? _value.name : name as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      status: status == freezed ? _value.status : status as String,
      startTime: startTime == freezed ? _value.startTime : startTime as String,
      endTime: endTime == freezed ? _value.endTime : endTime as String,
      startAddress: startAddress == freezed
          ? _value.startAddress
          : startAddress as String,
      endAddress:
          endAddress == freezed ? _value.endAddress : endAddress as String,
      startPhone:
          startPhone == freezed ? _value.startPhone : startPhone as String,
      endPhone: endPhone == freezed ? _value.endPhone : endPhone as String,
      coast: coast == freezed ? _value.coast : coast as String,
    ));
  }
}

/// @nodoc
abstract class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) then) =
      __$OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      @JsonKey(name: 'start_address') String startAddress,
      @JsonKey(name: 'end_address') String endAddress,
      @JsonKey(name: 'start_phone') String startPhone,
      @JsonKey(name: 'end_phone') String endPhone,
      @JsonKey(name: 'coast') String coast});
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(_Order _value, $Res Function(_Order) _then)
      : super(_value, (v) => _then(v as _Order));

  @override
  _Order get _value => super._value as _Order;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object imageUrl = freezed,
    Object status = freezed,
    Object startTime = freezed,
    Object endTime = freezed,
    Object startAddress = freezed,
    Object endAddress = freezed,
    Object startPhone = freezed,
    Object endPhone = freezed,
    Object coast = freezed,
  }) {
    return _then(_Order(
      id: id == freezed ? _value.id : id as num,
      name: name == freezed ? _value.name : name as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      status: status == freezed ? _value.status : status as String,
      startTime: startTime == freezed ? _value.startTime : startTime as String,
      endTime: endTime == freezed ? _value.endTime : endTime as String,
      startAddress: startAddress == freezed
          ? _value.startAddress
          : startAddress as String,
      endAddress:
          endAddress == freezed ? _value.endAddress : endAddress as String,
      startPhone:
          startPhone == freezed ? _value.startPhone : startPhone as String,
      endPhone: endPhone == freezed ? _value.endPhone : endPhone as String,
      coast: coast == freezed ? _value.coast : coast as String,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_Order implements _Order {
  const _$_Order(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'start_address') this.startAddress,
      @JsonKey(name: 'end_address') this.endAddress,
      @JsonKey(name: 'start_phone') this.startPhone,
      @JsonKey(name: 'end_phone') this.endPhone,
      @JsonKey(name: 'coast') this.coast});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderFromJson(json);

  @override
  @JsonKey(name: 'id')
  final num id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  @JsonKey(name: 'start_address')
  final String startAddress;
  @override
  @JsonKey(name: 'end_address')
  final String endAddress;
  @override
  @JsonKey(name: 'start_phone')
  final String startPhone;
  @override
  @JsonKey(name: 'end_phone')
  final String endPhone;
  @override
  @JsonKey(name: 'coast')
  final String coast;

  @override
  String toString() {
    return 'Order(id: $id, name: $name, imageUrl: $imageUrl, status: $status, startTime: $startTime, endTime: $endTime, startAddress: $startAddress, endAddress: $endAddress, startPhone: $startPhone, endPhone: $endPhone, coast: $coast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Order &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)) &&
            (identical(other.endTime, endTime) ||
                const DeepCollectionEquality()
                    .equals(other.endTime, endTime)) &&
            (identical(other.startAddress, startAddress) ||
                const DeepCollectionEquality()
                    .equals(other.startAddress, startAddress)) &&
            (identical(other.endAddress, endAddress) ||
                const DeepCollectionEquality()
                    .equals(other.endAddress, endAddress)) &&
            (identical(other.startPhone, startPhone) ||
                const DeepCollectionEquality()
                    .equals(other.startPhone, startPhone)) &&
            (identical(other.endPhone, endPhone) ||
                const DeepCollectionEquality()
                    .equals(other.endPhone, endPhone)) &&
            (identical(other.coast, coast) ||
                const DeepCollectionEquality().equals(other.coast, coast)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(startTime) ^
      const DeepCollectionEquality().hash(endTime) ^
      const DeepCollectionEquality().hash(startAddress) ^
      const DeepCollectionEquality().hash(endAddress) ^
      const DeepCollectionEquality().hash(startPhone) ^
      const DeepCollectionEquality().hash(endPhone) ^
      const DeepCollectionEquality().hash(coast);

  @override
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderToJson(this);
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      @JsonKey(name: 'start_address') String startAddress,
      @JsonKey(name: 'end_address') String endAddress,
      @JsonKey(name: 'start_phone') String startPhone,
      @JsonKey(name: 'end_phone') String endPhone,
      @JsonKey(name: 'coast') String coast}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  @JsonKey(name: 'id')
  num get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'imageUrl')
  String get imageUrl;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  @JsonKey(name: 'start_address')
  String get startAddress;
  @override
  @JsonKey(name: 'end_address')
  String get endAddress;
  @override
  @JsonKey(name: 'start_phone')
  String get startPhone;
  @override
  @JsonKey(name: 'end_phone')
  String get endPhone;
  @override
  @JsonKey(name: 'coast')
  String get coast;
  @override
  _$OrderCopyWith<_Order> get copyWith;
}
