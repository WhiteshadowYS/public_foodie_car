// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Brand _$BrandFromJson(Map<String, dynamic> json) {
  return _Brand.fromJson(json);
}

/// @nodoc
class _$BrandTearOff {
  const _$BrandTearOff();

// ignore: unused_element
  _Brand call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'locations') List<Location> locations}) {
    return _Brand(
      id: id,
      status: status,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
      locations: locations,
    );
  }

// ignore: unused_element
  Brand fromJson(Map<String, Object> json) {
    return Brand.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Brand = _$BrandTearOff();

/// @nodoc
mixin _$Brand {
  @JsonKey(name: 'id')
  num get id;
  @JsonKey(name: 'status')
  num get status;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @JsonKey(name: 'locations')
  List<Location> get locations;

  Map<String, dynamic> toJson();
  $BrandCopyWith<Brand> get copyWith;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'locations') List<Location> locations});
}

/// @nodoc
class _$BrandCopyWithImpl<$Res> implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  final Brand _value;
  // ignore: unused_field
  final $Res Function(Brand) _then;

  @override
  $Res call({
    Object id = freezed,
    Object status = freezed,
    Object name = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object locations = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as num,
      status: status == freezed ? _value.status : status as num,
      name: name == freezed ? _value.name : name as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      locations:
          locations == freezed ? _value.locations : locations as List<Location>,
    ));
  }
}

/// @nodoc
abstract class _$BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$BrandCopyWith(_Brand value, $Res Function(_Brand) then) =
      __$BrandCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'locations') List<Location> locations});
}

/// @nodoc
class __$BrandCopyWithImpl<$Res> extends _$BrandCopyWithImpl<$Res>
    implements _$BrandCopyWith<$Res> {
  __$BrandCopyWithImpl(_Brand _value, $Res Function(_Brand) _then)
      : super(_value, (v) => _then(v as _Brand));

  @override
  _Brand get _value => super._value as _Brand;

  @override
  $Res call({
    Object id = freezed,
    Object status = freezed,
    Object name = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object locations = freezed,
  }) {
    return _then(_Brand(
      id: id == freezed ? _value.id : id as num,
      status: status == freezed ? _value.status : status as num,
      name: name == freezed ? _value.name : name as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      locations:
          locations == freezed ? _value.locations : locations as List<Location>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_Brand implements _Brand {
  const _$_Brand(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'locations') this.locations});

  factory _$_Brand.fromJson(Map<String, dynamic> json) =>
      _$_$_BrandFromJson(json);

  @override
  @JsonKey(name: 'id')
  final num id;
  @override
  @JsonKey(name: 'status')
  final num status;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'locations')
  final List<Location> locations;

  @override
  String toString() {
    return 'Brand(id: $id, status: $status, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Brand &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.locations, locations) ||
                const DeepCollectionEquality()
                    .equals(other.locations, locations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(locations);

  @override
  _$BrandCopyWith<_Brand> get copyWith =>
      __$BrandCopyWithImpl<_Brand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BrandToJson(this);
  }
}

abstract class _Brand implements Brand {
  const factory _Brand(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'locations') List<Location> locations}) = _$_Brand;

  factory _Brand.fromJson(Map<String, dynamic> json) = _$_Brand.fromJson;

  @override
  @JsonKey(name: 'id')
  num get id;
  @override
  @JsonKey(name: 'status')
  num get status;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'locations')
  List<Location> get locations;
  @override
  _$BrandCopyWith<_Brand> get copyWith;
}
