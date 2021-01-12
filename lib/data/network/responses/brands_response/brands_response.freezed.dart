// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'brands_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BrandsResponse _$BrandsResponseFromJson(Map<String, dynamic> json) {
  return _BrandsResponse.fromJson(json);
}

/// @nodoc
class _$BrandsResponseTearOff {
  const _$BrandsResponseTearOff();

// ignore: unused_element
  _BrandsResponse call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Brand> brands}) {
    return _BrandsResponse(
      error: error,
      brands: brands,
    );
  }

// ignore: unused_element
  BrandsResponse fromJson(Map<String, Object> json) {
    return BrandsResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BrandsResponse = _$BrandsResponseTearOff();

/// @nodoc
mixin _$BrandsResponse {
  @JsonKey(name: 'error')
  String get error;
  @JsonKey(name: 'data')
  List<Brand> get brands;

  Map<String, dynamic> toJson();
  $BrandsResponseCopyWith<BrandsResponse> get copyWith;
}

/// @nodoc
abstract class $BrandsResponseCopyWith<$Res> {
  factory $BrandsResponseCopyWith(
          BrandsResponse value, $Res Function(BrandsResponse) then) =
      _$BrandsResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Brand> brands});
}

/// @nodoc
class _$BrandsResponseCopyWithImpl<$Res>
    implements $BrandsResponseCopyWith<$Res> {
  _$BrandsResponseCopyWithImpl(this._value, this._then);

  final BrandsResponse _value;
  // ignore: unused_field
  final $Res Function(BrandsResponse) _then;

  @override
  $Res call({
    Object error = freezed,
    Object brands = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      brands: brands == freezed ? _value.brands : brands as List<Brand>,
    ));
  }
}

/// @nodoc
abstract class _$BrandsResponseCopyWith<$Res>
    implements $BrandsResponseCopyWith<$Res> {
  factory _$BrandsResponseCopyWith(
          _BrandsResponse value, $Res Function(_BrandsResponse) then) =
      __$BrandsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Brand> brands});
}

/// @nodoc
class __$BrandsResponseCopyWithImpl<$Res>
    extends _$BrandsResponseCopyWithImpl<$Res>
    implements _$BrandsResponseCopyWith<$Res> {
  __$BrandsResponseCopyWithImpl(
      _BrandsResponse _value, $Res Function(_BrandsResponse) _then)
      : super(_value, (v) => _then(v as _BrandsResponse));

  @override
  _BrandsResponse get _value => super._value as _BrandsResponse;

  @override
  $Res call({
    Object error = freezed,
    Object brands = freezed,
  }) {
    return _then(_BrandsResponse(
      error: error == freezed ? _value.error : error as String,
      brands: brands == freezed ? _value.brands : brands as List<Brand>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_BrandsResponse implements _BrandsResponse {
  const _$_BrandsResponse(
      {@JsonKey(name: 'error') this.error, @JsonKey(name: 'data') this.brands});

  factory _$_BrandsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BrandsResponseFromJson(json);

  @override
  @JsonKey(name: 'error')
  final String error;
  @override
  @JsonKey(name: 'data')
  final List<Brand> brands;

  @override
  String toString() {
    return 'BrandsResponse(error: $error, brands: $brands)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BrandsResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.brands, brands) ||
                const DeepCollectionEquality().equals(other.brands, brands)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(brands);

  @override
  _$BrandsResponseCopyWith<_BrandsResponse> get copyWith =>
      __$BrandsResponseCopyWithImpl<_BrandsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BrandsResponseToJson(this);
  }
}

abstract class _BrandsResponse implements BrandsResponse {
  const factory _BrandsResponse(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Brand> brands}) = _$_BrandsResponse;

  factory _BrandsResponse.fromJson(Map<String, dynamic> json) =
      _$_BrandsResponse.fromJson;

  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(name: 'data')
  List<Brand> get brands;
  @override
  _$BrandsResponseCopyWith<_BrandsResponse> get copyWith;
}
