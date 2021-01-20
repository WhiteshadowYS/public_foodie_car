// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'products_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProductsPageLanguage _$ProductsPageLanguageFromJson(Map<String, dynamic> json) {
  return _ProductsPageLanguage.fromJson(json);
}

/// @nodoc
class _$ProductsPageLanguageTearOff {
  const _$ProductsPageLanguageTearOff();

// ignore: unused_element
  _ProductsPageLanguage call({@required String title}) {
    return _ProductsPageLanguage(
      title: title,
    );
  }

// ignore: unused_element
  ProductsPageLanguage fromJson(Map<String, Object> json) {
    return ProductsPageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProductsPageLanguage = _$ProductsPageLanguageTearOff();

/// @nodoc
mixin _$ProductsPageLanguage {
  String get title;

  Map<String, dynamic> toJson();
  $ProductsPageLanguageCopyWith<ProductsPageLanguage> get copyWith;
}

/// @nodoc
abstract class $ProductsPageLanguageCopyWith<$Res> {
  factory $ProductsPageLanguageCopyWith(ProductsPageLanguage value,
          $Res Function(ProductsPageLanguage) then) =
      _$ProductsPageLanguageCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$ProductsPageLanguageCopyWithImpl<$Res>
    implements $ProductsPageLanguageCopyWith<$Res> {
  _$ProductsPageLanguageCopyWithImpl(this._value, this._then);

  final ProductsPageLanguage _value;
  // ignore: unused_field
  final $Res Function(ProductsPageLanguage) _then;

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
abstract class _$ProductsPageLanguageCopyWith<$Res>
    implements $ProductsPageLanguageCopyWith<$Res> {
  factory _$ProductsPageLanguageCopyWith(_ProductsPageLanguage value,
          $Res Function(_ProductsPageLanguage) then) =
      __$ProductsPageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$ProductsPageLanguageCopyWithImpl<$Res>
    extends _$ProductsPageLanguageCopyWithImpl<$Res>
    implements _$ProductsPageLanguageCopyWith<$Res> {
  __$ProductsPageLanguageCopyWithImpl(
      _ProductsPageLanguage _value, $Res Function(_ProductsPageLanguage) _then)
      : super(_value, (v) => _then(v as _ProductsPageLanguage));

  @override
  _ProductsPageLanguage get _value => super._value as _ProductsPageLanguage;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_ProductsPageLanguage(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProductsPageLanguage implements _ProductsPageLanguage {
  const _$_ProductsPageLanguage({@required this.title}) : assert(title != null);

  factory _$_ProductsPageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductsPageLanguageFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'ProductsPageLanguage(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductsPageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$ProductsPageLanguageCopyWith<_ProductsPageLanguage> get copyWith =>
      __$ProductsPageLanguageCopyWithImpl<_ProductsPageLanguage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductsPageLanguageToJson(this);
  }
}

abstract class _ProductsPageLanguage implements ProductsPageLanguage {
  const factory _ProductsPageLanguage({@required String title}) =
      _$_ProductsPageLanguage;

  factory _ProductsPageLanguage.fromJson(Map<String, dynamic> json) =
      _$_ProductsPageLanguage.fromJson;

  @override
  String get title;
  @override
  _$ProductsPageLanguageCopyWith<_ProductsPageLanguage> get copyWith;
}
