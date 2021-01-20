// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProductPageLanguage _$ProductPageLanguageFromJson(Map<String, dynamic> json) {
  return _ProductPageLanguage.fromJson(json);
}

/// @nodoc
class _$ProductPageLanguageTearOff {
  const _$ProductPageLanguageTearOff();

// ignore: unused_element
  _ProductPageLanguage call({@required String title}) {
    return _ProductPageLanguage(
      title: title,
    );
  }

// ignore: unused_element
  ProductPageLanguage fromJson(Map<String, Object> json) {
    return ProductPageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProductPageLanguage = _$ProductPageLanguageTearOff();

/// @nodoc
mixin _$ProductPageLanguage {
  String get title;

  Map<String, dynamic> toJson();
  $ProductPageLanguageCopyWith<ProductPageLanguage> get copyWith;
}

/// @nodoc
abstract class $ProductPageLanguageCopyWith<$Res> {
  factory $ProductPageLanguageCopyWith(
          ProductPageLanguage value, $Res Function(ProductPageLanguage) then) =
      _$ProductPageLanguageCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$ProductPageLanguageCopyWithImpl<$Res>
    implements $ProductPageLanguageCopyWith<$Res> {
  _$ProductPageLanguageCopyWithImpl(this._value, this._then);

  final ProductPageLanguage _value;
  // ignore: unused_field
  final $Res Function(ProductPageLanguage) _then;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductPageLanguageCopyWith<$Res>
    implements $ProductPageLanguageCopyWith<$Res> {
  factory _$ProductPageLanguageCopyWith(_ProductPageLanguage value,
          $Res Function(_ProductPageLanguage) then) =
      __$ProductPageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$ProductPageLanguageCopyWithImpl<$Res>
    extends _$ProductPageLanguageCopyWithImpl<$Res>
    implements _$ProductPageLanguageCopyWith<$Res> {
  __$ProductPageLanguageCopyWithImpl(
      _ProductPageLanguage _value, $Res Function(_ProductPageLanguage) _then)
      : super(_value, (v) => _then(v as _ProductPageLanguage));

  @override
  _ProductPageLanguage get _value => super._value as _ProductPageLanguage;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_ProductPageLanguage(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProductPageLanguage implements _ProductPageLanguage {
  const _$_ProductPageLanguage({@required this.title}) : assert(title != null);

  factory _$_ProductPageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductPageLanguageFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'ProductPageLanguage(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductPageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$ProductPageLanguageCopyWith<_ProductPageLanguage> get copyWith =>
      __$ProductPageLanguageCopyWithImpl<_ProductPageLanguage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductPageLanguageToJson(this);
  }
}

abstract class _ProductPageLanguage implements ProductPageLanguage {
  const factory _ProductPageLanguage({@required String title}) =
      _$_ProductPageLanguage;

  factory _ProductPageLanguage.fromJson(Map<String, dynamic> json) =
      _$_ProductPageLanguage.fromJson;

  @override
  String get title;
  @override
  _$ProductPageLanguageCopyWith<_ProductPageLanguage> get copyWith;
}
