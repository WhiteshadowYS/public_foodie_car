// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cafe_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CafeResponse _$CafeResponseFromJson(Map<String, dynamic> json) {
  return _CafeResponse.fromJson(json);
}

/// @nodoc
class _$CafeResponseTearOff {
  const _$CafeResponseTearOff();

// ignore: unused_element
  _CafeResponse call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Cafe> cafeList}) {
    return _CafeResponse(
      error: error,
      cafeList: cafeList,
    );
  }

// ignore: unused_element
  CafeResponse fromJson(Map<String, Object> json) {
    return CafeResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CafeResponse = _$CafeResponseTearOff();

/// @nodoc
mixin _$CafeResponse {
  @JsonKey(name: 'error')
  String get error;
  @JsonKey(name: 'data')
  List<Cafe> get cafeList;

  Map<String, dynamic> toJson();
  $CafeResponseCopyWith<CafeResponse> get copyWith;
}

/// @nodoc
abstract class $CafeResponseCopyWith<$Res> {
  factory $CafeResponseCopyWith(
          CafeResponse value, $Res Function(CafeResponse) then) =
      _$CafeResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Cafe> cafeList});
}

/// @nodoc
class _$CafeResponseCopyWithImpl<$Res> implements $CafeResponseCopyWith<$Res> {
  _$CafeResponseCopyWithImpl(this._value, this._then);

  final CafeResponse _value;
  // ignore: unused_field
  final $Res Function(CafeResponse) _then;

  @override
  $Res call({
    Object error = freezed,
    Object cafeList = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      cafeList: cafeList == freezed ? _value.cafeList : cafeList as List<Cafe>,
    ));
  }
}

/// @nodoc
abstract class _$CafeResponseCopyWith<$Res>
    implements $CafeResponseCopyWith<$Res> {
  factory _$CafeResponseCopyWith(
          _CafeResponse value, $Res Function(_CafeResponse) then) =
      __$CafeResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Cafe> cafeList});
}

/// @nodoc
class __$CafeResponseCopyWithImpl<$Res> extends _$CafeResponseCopyWithImpl<$Res>
    implements _$CafeResponseCopyWith<$Res> {
  __$CafeResponseCopyWithImpl(
      _CafeResponse _value, $Res Function(_CafeResponse) _then)
      : super(_value, (v) => _then(v as _CafeResponse));

  @override
  _CafeResponse get _value => super._value as _CafeResponse;

  @override
  $Res call({
    Object error = freezed,
    Object cafeList = freezed,
  }) {
    return _then(_CafeResponse(
      error: error == freezed ? _value.error : error as String,
      cafeList: cafeList == freezed ? _value.cafeList : cafeList as List<Cafe>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_CafeResponse implements _CafeResponse {
  const _$_CafeResponse(
      {@JsonKey(name: 'error') this.error,
      @JsonKey(name: 'data') this.cafeList});

  factory _$_CafeResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_CafeResponseFromJson(json);

  @override
  @JsonKey(name: 'error')
  final String error;
  @override
  @JsonKey(name: 'data')
  final List<Cafe> cafeList;

  @override
  String toString() {
    return 'CafeResponse(error: $error, cafeList: $cafeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CafeResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.cafeList, cafeList) ||
                const DeepCollectionEquality()
                    .equals(other.cafeList, cafeList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(cafeList);

  @override
  _$CafeResponseCopyWith<_CafeResponse> get copyWith =>
      __$CafeResponseCopyWithImpl<_CafeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CafeResponseToJson(this);
  }
}

abstract class _CafeResponse implements CafeResponse {
  const factory _CafeResponse(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Cafe> cafeList}) = _$_CafeResponse;

  factory _CafeResponse.fromJson(Map<String, dynamic> json) =
      _$_CafeResponse.fromJson;

  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(name: 'data')
  List<Cafe> get cafeList;
  @override
  _$CafeResponseCopyWith<_CafeResponse> get copyWith;
}
