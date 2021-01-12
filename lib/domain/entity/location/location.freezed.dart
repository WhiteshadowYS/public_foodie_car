// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

// ignore: unused_element
  _Location call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug}) {
    return _Location(
      id: id,
      name: name,
      slug: slug,
    );
  }

// ignore: unused_element
  Location fromJson(Map<String, Object> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  @JsonKey(name: 'id')
  num get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'slug')
  String get slug;

  Map<String, dynamic> toJson();
  $LocationCopyWith<Location> get copyWith;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

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
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object slug = freezed,
  }) {
    return _then(_Location(
      id: id == freezed ? _value.id : id as num,
      name: name == freezed ? _value.name : name as String,
      slug: slug == freezed ? _value.slug : slug as String,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_Location implements _Location {
  const _$_Location(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'slug') this.slug});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$_$_LocationFromJson(json);

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
    return 'Location(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
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
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'slug') String slug}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

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
  _$LocationCopyWith<_Location> get copyWith;
}
