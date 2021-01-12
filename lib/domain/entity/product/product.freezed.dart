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
      @JsonKey(name: 'price') num price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'String') String imageUrl}) {
    return _Product(
      id: id,
      title: title,
      description: description,
      price: price,
      weight: weight,
      imageUrl: imageUrl,
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
  @JsonKey(name: 'price')
  num get price;
  @JsonKey(name: 'weight')
  num get weight;
  @JsonKey(name: 'String')
  String get imageUrl;

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
      @JsonKey(name: 'price') num price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'String') String imageUrl});
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
    Object price = freezed,
    Object weight = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as num,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      price: price == freezed ? _value.price : price as num,
      weight: weight == freezed ? _value.weight : weight as num,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
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
      @JsonKey(name: 'price') num price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'String') String imageUrl});
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
    Object price = freezed,
    Object weight = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_Product(
      id: id == freezed ? _value.id : id as num,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      price: price == freezed ? _value.price : price as num,
      weight: weight == freezed ? _value.weight : weight as num,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
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
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'weight') this.weight,
      @JsonKey(name: 'String') this.imageUrl});

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
  @JsonKey(name: 'price')
  final num price;
  @override
  @JsonKey(name: 'weight')
  final num weight;
  @override
  @JsonKey(name: 'String')
  final String imageUrl;

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, price: $price, weight: $weight, imageUrl: $imageUrl)';
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
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(imageUrl);

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
      @JsonKey(name: 'price') num price,
      @JsonKey(name: 'weight') num weight,
      @JsonKey(name: 'String') String imageUrl}) = _$_Product;

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
  @JsonKey(name: 'price')
  num get price;
  @override
  @JsonKey(name: 'weight')
  num get weight;
  @override
  @JsonKey(name: 'String')
  String get imageUrl;
  @override
  _$ProductCopyWith<_Product> get copyWith;
}
