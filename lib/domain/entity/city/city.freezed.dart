// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
class _$CityTearOff {
  const _$CityTearOff();

// ignore: unused_element
  _City call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug}) {
    return _City(
      id: id,
      name: name,
      slug: slug,
    );
  }

// ignore: unused_element
  City fromJson(Map<String, Object> json) {
    return City.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $City = _$CityTearOff();

/// @nodoc
mixin _$City {
  @JsonKey(name: 'id')
  num get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'slug')
  String get slug;

  Map<String, dynamic> toJson();
  $CityCopyWith<City> get copyWith;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug});
}

/// @nodoc
class _$CityCopyWithImpl<$Res> implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  final City _value;
  // ignore: unused_field
  final $Res Function(City) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object slug = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as num,
      name: name == freezed ? _value.name : name as String,
      slug: slug == freezed ? _value.slug : slug as String,
    ));
  }
}

/// @nodoc
abstract class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) then) =
      __$CityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug});
}

/// @nodoc
class __$CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(_City _value, $Res Function(_City) _then)
      : super(_value, (v) => _then(v as _City));

  @override
  _City get _value => super._value as _City;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object slug = freezed,
  }) {
    return _then(_City(
      id: id == freezed ? _value.id : id as num,
      name: name == freezed ? _value.name : name as String,
      slug: slug == freezed ? _value.slug : slug as String,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_City implements _City {
  const _$_City(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'slug') this.slug});

  factory _$_City.fromJson(Map<String, dynamic> json) =>
      _$_$_CityFromJson(json);

  @override
  @JsonKey(name: 'id')
  final num id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'slug')
  final String slug;

  @override
  String toString() {
    return 'City(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _City &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(slug);

  @override
  _$CityCopyWith<_City> get copyWith =>
      __$CityCopyWithImpl<_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CityToJson(this);
  }
}

abstract class _City implements City {
  const factory _City(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  @JsonKey(name: 'id')
  num get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'slug')
  String get slug;
  @override
  _$CityCopyWith<_City> get copyWith;
}
