// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) {
  return _ProductsResponse.fromJson(json);
}

/// @nodoc
class _$ProductsResponseTearOff {
  const _$ProductsResponseTearOff();

// ignore: unused_element
  _ProductsResponse call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Product> products}) {
    return _ProductsResponse(
      error: error,
      products: products,
    );
  }

// ignore: unused_element
  ProductsResponse fromJson(Map<String, Object> json) {
    return ProductsResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProductsResponse = _$ProductsResponseTearOff();

/// @nodoc
mixin _$ProductsResponse {
  @JsonKey(name: 'error')
  String get error;
  @JsonKey(name: 'data')
  List<Product> get products;

  Map<String, dynamic> toJson();
  $ProductsResponseCopyWith<ProductsResponse> get copyWith;
}

/// @nodoc
abstract class $ProductsResponseCopyWith<$Res> {
  factory $ProductsResponseCopyWith(
          ProductsResponse value, $Res Function(ProductsResponse) then) =
      _$ProductsResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Product> products});
}

/// @nodoc
class _$ProductsResponseCopyWithImpl<$Res>
    implements $ProductsResponseCopyWith<$Res> {
  _$ProductsResponseCopyWithImpl(this._value, this._then);

  final ProductsResponse _value;
  // ignore: unused_field
  final $Res Function(ProductsResponse) _then;

  @override
  $Res call({
    Object error = freezed,
    Object products = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      products:
          products == freezed ? _value.products : products as List<Product>,
    ));
  }
}

/// @nodoc
abstract class _$ProductsResponseCopyWith<$Res>
    implements $ProductsResponseCopyWith<$Res> {
  factory _$ProductsResponseCopyWith(
          _ProductsResponse value, $Res Function(_ProductsResponse) then) =
      __$ProductsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Product> products});
}

/// @nodoc
class __$ProductsResponseCopyWithImpl<$Res>
    extends _$ProductsResponseCopyWithImpl<$Res>
    implements _$ProductsResponseCopyWith<$Res> {
  __$ProductsResponseCopyWithImpl(
      _ProductsResponse _value, $Res Function(_ProductsResponse) _then)
      : super(_value, (v) => _then(v as _ProductsResponse));

  @override
  _ProductsResponse get _value => super._value as _ProductsResponse;

  @override
  $Res call({
    Object error = freezed,
    Object products = freezed,
  }) {
    return _then(_ProductsResponse(
      error: error == freezed ? _value.error : error as String,
      products:
          products == freezed ? _value.products : products as List<Product>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_ProductsResponse implements _ProductsResponse {
  const _$_ProductsResponse(
      {@JsonKey(name: 'error') this.error,
      @JsonKey(name: 'data') this.products});

  factory _$_ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductsResponseFromJson(json);

  @override
  @JsonKey(name: 'error')
  final String error;
  @override
  @JsonKey(name: 'data')
  final List<Product> products;

  @override
  String toString() {
    return 'ProductsResponse(error: $error, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductsResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(products);

  @override
  _$ProductsResponseCopyWith<_ProductsResponse> get copyWith =>
      __$ProductsResponseCopyWithImpl<_ProductsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductsResponseToJson(this);
  }
}

abstract class _ProductsResponse implements ProductsResponse {
  const factory _ProductsResponse(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Product> products}) = _$_ProductsResponse;

  factory _ProductsResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductsResponse.fromJson;

  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(name: 'data')
  List<Product> get products;
  @override
  _$ProductsResponseCopyWith<_ProductsResponse> get copyWith;
}
