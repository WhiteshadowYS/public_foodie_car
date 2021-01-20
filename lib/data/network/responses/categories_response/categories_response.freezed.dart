// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'categories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) {
  return _CategoriesResponse.fromJson(json);
}

/// @nodoc
class _$CategoriesResponseTearOff {
  const _$CategoriesResponseTearOff();

// ignore: unused_element
  _CategoriesResponse call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Category> categories}) {
    return _CategoriesResponse(
      error: error,
      categories: categories,
    );
  }

// ignore: unused_element
  CategoriesResponse fromJson(Map<String, Object> json) {
    return CategoriesResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CategoriesResponse = _$CategoriesResponseTearOff();

/// @nodoc
mixin _$CategoriesResponse {
  @JsonKey(name: 'error')
  String get error;
  @JsonKey(name: 'data')
  List<Category> get categories;

  Map<String, dynamic> toJson();
  $CategoriesResponseCopyWith<CategoriesResponse> get copyWith;
}

/// @nodoc
abstract class $CategoriesResponseCopyWith<$Res> {
  factory $CategoriesResponseCopyWith(
          CategoriesResponse value, $Res Function(CategoriesResponse) then) =
      _$CategoriesResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Category> categories});
}

/// @nodoc
class _$CategoriesResponseCopyWithImpl<$Res>
    implements $CategoriesResponseCopyWith<$Res> {
  _$CategoriesResponseCopyWithImpl(this._value, this._then);

  final CategoriesResponse _value;
  // ignore: unused_field
  final $Res Function(CategoriesResponse) _then;

  @override
  $Res call({
    Object error = freezed,
    Object categories = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      categories: categories == freezed
          ? _value.categories
          : categories as List<Category>,
    ));
  }
}

/// @nodoc
abstract class _$CategoriesResponseCopyWith<$Res>
    implements $CategoriesResponseCopyWith<$Res> {
  factory _$CategoriesResponseCopyWith(
          _CategoriesResponse value, $Res Function(_CategoriesResponse) then) =
      __$CategoriesResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'error') String error,
      @JsonKey(name: 'data') List<Category> categories});
}

/// @nodoc
class __$CategoriesResponseCopyWithImpl<$Res>
    extends _$CategoriesResponseCopyWithImpl<$Res>
    implements _$CategoriesResponseCopyWith<$Res> {
  __$CategoriesResponseCopyWithImpl(
      _CategoriesResponse _value, $Res Function(_CategoriesResponse) _then)
      : super(_value, (v) => _then(v as _CategoriesResponse));

  @override
  _CategoriesResponse get _value => super._value as _CategoriesResponse;

  @override
  $Res call({
    Object error = freezed,
    Object categories = freezed,
  }) {
    return _then(_CategoriesResponse(
      error: error == freezed ? _value.error : error as String,
      categories: categories == freezed
          ? _value.categories
          : categories as List<Category>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_CategoriesResponse implements _CategoriesResponse {
  const _$_CategoriesResponse(
      {@JsonKey(name: 'error') this.error,
      @JsonKey(name: 'data') this.categories});

  factory _$_CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoriesResponseFromJson(json);

  @override
  @JsonKey(name: 'error')
  final String error;
  @override
  @JsonKey(name: 'data')
  final List<Category> categories;

  @override
  String toString() {
    return 'CategoriesResponse(error: $error, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoriesResponse &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(categories);

  @override
  _$CategoriesResponseCopyWith<_CategoriesResponse> get copyWith =>
      __$CategoriesResponseCopyWithImpl<_CategoriesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoriesResponseToJson(this);
  }
}

abstract class _CategoriesResponse implements CategoriesResponse {
  const factory _CategoriesResponse(
          {@JsonKey(name: 'error') String error,
          @JsonKey(name: 'data') List<Category> categories}) =
      _$_CategoriesResponse;

  factory _CategoriesResponse.fromJson(Map<String, dynamic> json) =
      _$_CategoriesResponse.fromJson;

  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(name: 'data')
  List<Category> get categories;
  @override
  _$CategoriesResponseCopyWith<_CategoriesResponse> get copyWith;
}
