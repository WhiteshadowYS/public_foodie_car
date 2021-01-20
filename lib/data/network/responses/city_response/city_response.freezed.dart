// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'city_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CityResponse _$CityResponseFromJson(Map<String, dynamic> json) {
  return _CityResponse.fromJson(json);
}

/// @nodoc
class _$CityResponseTearOff {
  const _$CityResponseTearOff();

// ignore: unused_element
  _CityResponse call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<City> cityList}) {
    return _CityResponse(
      error: error,
      cityList: cityList,
    );
  }

// ignore: unused_element
  CityResponse fromJson(Map<String, Object> json) {
    return CityResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CityResponse = _$CityResponseTearOff();

/// @nodoc
mixin _$CityResponse {
  @JsonKey(name: 'error')
  String get error;
  @JsonKey(name: 'data')
  List<City> get cityList;

  Map<String, dynamic> toJson();
  $CityResponseCopyWith<CityResponse> get copyWith;
}

/// @nodoc
abstract class $CityResponseCopyWith<$Res> {
  factory $CityResponseCopyWith(
          CityResponse value, $Res Function(CityResponse) then) =
      _$CityResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<City> cityList});
}

/// @nodoc
class _$CityResponseCopyWithImpl<$Res> implements $CityResponseCopyWith<$Res> {
  _$CityResponseCopyWithImpl(this._value, this._then);

  final CityResponse _value;
  // ignore: unused_field
  final $Res Function(CityResponse) _then;

  @override
  $Res call({
    Object error = freezed,
    Object cityList = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      cityList: cityList == freezed ? _value.cityList : cityList as List<City>,
    ));
  }
}

/// @nodoc
abstract class _$CityResponseCopyWith<$Res>
    implements $CityResponseCopyWith<$Res> {
  factory _$CityResponseCopyWith(
          _CityResponse value, $Res Function(_CityResponse) then) =
      __$CityResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<City> cityList});
}

/// @nodoc
class __$CityResponseCopyWithImpl<$Res> extends _$CityResponseCopyWithImpl<$Res>
    implements _$CityResponseCopyWith<$Res> {
  __$CityResponseCopyWithImpl(
      _CityResponse _value, $Res Function(_CityResponse) _then)
      : super(_value, (v) => _then(v as _CityResponse));

  @override
  _CityResponse get _value => super._value as _CityResponse;

  @override
  $Res call({
    Object error = freezed,
    Object cityList = freezed,
  }) {
    return _then(_CityResponse(
      error: error == freezed ? _value.error : error as String,
      cityList: cityList == freezed ? _value.cityList : cityList as List<City>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_CityResponse implements _CityResponse {
  const _$_CityResponse(
      {@JsonKey(name: 'error') this.error,
      @JsonKey(name: 'data') this.cityList});

  factory _$_CityResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_CityResponseFromJson(json);

  @override
  @JsonKey(name: 'error')
  final String error;
  @override
  @JsonKey(name: 'data')
  final List<City> cityList;

  @override
  String toString() {
    return 'CityResponse(error: $error, cityList: $cityList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CityResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.cityList, cityList) ||
                const DeepCollectionEquality()
                    .equals(other.cityList, cityList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(cityList);

  @override
  _$CityResponseCopyWith<_CityResponse> get copyWith =>
      __$CityResponseCopyWithImpl<_CityResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CityResponseToJson(this);
  }
}

abstract class _CityResponse implements CityResponse {
  const factory _CityResponse(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<City> cityList}) = _$_CityResponse;

  factory _CityResponse.fromJson(Map<String, dynamic> json) =
      _$_CityResponse.fromJson;

  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(name: 'data')
  List<City> get cityList;
  @override
  _$CityResponseCopyWith<_CityResponse> get copyWith;
}
