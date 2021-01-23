// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

// ignore: unused_element
  _Product call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'restourant') String restourant,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'base_image') BaseImage baseImage,
      @JsonKey(name: 'count', defaultValue: 0) num count}) {
    return _Product(
      id: id,
      title: title,
      description: description,
      category: category,
      restourant: restourant,
      price: price,
      weight: weight,
      baseImage: baseImage,
      count: count,
    );
  }

// ignore: unused_element
  Product fromJson(Map<String, Object> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'id')
  num get id;
  @JsonKey(name: 'title')
  String get title;
  @JsonKey(name: 'description')
  String get description;
  @JsonKey(name: 'category')
  String get category;
  @JsonKey(name: 'restourant')
  String get restourant;
  @JsonKey(name: 'price')
  String get price;
  @JsonKey(name: 'weight')
  num get weight;
  @JsonKey(name: 'base_image')
  BaseImage get baseImage;
  @JsonKey(name: 'count', defaultValue: 0)
  num get count;

  Map<String, dynamic> toJson();
  $ProductCopyWith<Product> get copyWith;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'restourant') String restourant,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'base_image') BaseImage baseImage,
      @JsonKey(name: 'count', defaultValue: 0) num count});

  $BaseImageCopyWith<$Res> get baseImage;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object description = freezed,
    Object category = freezed,
    Object restourant = freezed,
    Object price = freezed,
    Object weight = freezed,
    Object baseImage = freezed,
    Object count = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as num,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      category: category == freezed ? _value.category : category as String,
      restourant:
          restourant == freezed ? _value.restourant : restourant as String,
      price: price == freezed ? _value.price : price as String,
      weight: weight == freezed ? _value.weight : weight as num,
      baseImage:
          baseImage == freezed ? _value.baseImage : baseImage as BaseImage,
      count: count == freezed ? _value.count : count as num,
    ));
  }

  @override
  $BaseImageCopyWith<$Res> get baseImage {
    if (_value.baseImage == null) {
      return null;
    }
    return $BaseImageCopyWith<$Res>(_value.baseImage, (value) {
      return _then(_value.copyWith(baseImage: value));
    });
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'restourant') String restourant,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'base_image') BaseImage baseImage,
      @JsonKey(name: 'count', defaultValue: 0) num count});

  @override
  $BaseImageCopyWith<$Res> get baseImage;
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object description = freezed,
    Object category = freezed,
    Object restourant = freezed,
    Object price = freezed,
    Object weight = freezed,
    Object baseImage = freezed,
    Object count = freezed,
  }) {
    return _then(_Product(
      id: id == freezed ? _value.id : id as num,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      category: category == freezed ? _value.category : category as String,
      restourant:
          restourant == freezed ? _value.restourant : restourant as String,
      price: price == freezed ? _value.price : price as String,
      weight: weight == freezed ? _value.weight : weight as num,
      baseImage:
          baseImage == freezed ? _value.baseImage : baseImage as BaseImage,
      count: count == freezed ? _value.count : count as num,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_Product implements _Product {
  const _$_Product(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'restourant') this.restourant,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'weight') this.weight,
      @JsonKey(name: 'base_image') this.baseImage,
      @JsonKey(name: 'count', defaultValue: 0) this.count});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFromJson(json);

  @override
  @JsonKey(name: 'id')
  final num id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'category')
  final String category;
  @override
  @JsonKey(name: 'restourant')
  final String restourant;
  @override
  @JsonKey(name: 'price')
  final String price;
  @override
  @JsonKey(name: 'weight')
  final num weight;
  @override
  @JsonKey(name: 'base_image')
  final BaseImage baseImage;
  @override
  @JsonKey(name: 'count', defaultValue: 0)
  final num count;

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, category: $category, restourant: $restourant, price: $price, weight: $weight, baseImage: $baseImage, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.restourant, restourant) ||
                const DeepCollectionEquality()
                    .equals(other.restourant, restourant)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.baseImage, baseImage) ||
                const DeepCollectionEquality()
                    .equals(other.baseImage, baseImage)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(restourant) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(baseImage) ^
      const DeepCollectionEquality().hash(count);

  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'restourant') String restourant,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'base_image') BaseImage baseImage,
      @JsonKey(name: 'count', defaultValue: 0) num count}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  @JsonKey(name: 'id')
  num get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'category')
  String get category;
  @override
  @JsonKey(name: 'restourant')
  String get restourant;
  @override
  @JsonKey(name: 'price')
  String get price;
  @override
  @JsonKey(name: 'weight')
  num get weight;
  @override
  @JsonKey(name: 'base_image')
  BaseImage get baseImage;
  @override
  @JsonKey(name: 'count', defaultValue: 0)
  num get count;
  @override
  _$ProductCopyWith<_Product> get copyWith;
}
