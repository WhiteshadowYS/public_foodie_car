// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cafe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Cafe _$CafeFromJson(Map<String, dynamic> json) {
  return _Cafe.fromJson(json);
}

/// @nodoc
class _$CafeTearOff {
  const _$CafeTearOff();

// ignore: unused_element
  _Cafe call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'locations') List<City> locations,
      @JsonKey(name: 'images') List<String> images}) {
    return _Cafe(
      id: id,
      status: status,
      name: name,
      description: description,
      imageUrl: imageUrl,
      locations: locations,
      images: images,
    );
  }

// ignore: unused_element
  Cafe fromJson(Map<String, Object> json) {
    return Cafe.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Cafe = _$CafeTearOff();

/// @nodoc
mixin _$Cafe {
  @JsonKey(name: 'id')
  num get id;
  @JsonKey(name: 'status')
  num get status;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'description')
  String get description;
  @JsonKey(name: 'imageUrl')
  String get imageUrl;
  @JsonKey(name: 'locations')
  List<City> get locations;
  @JsonKey(name: 'images')
  List<String> get images;

  Map<String, dynamic> toJson();
  $CafeCopyWith<Cafe> get copyWith;
}

/// @nodoc
abstract class $CafeCopyWith<$Res> {
  factory $CafeCopyWith(Cafe value, $Res Function(Cafe) then) =
      _$CafeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'locations') List<City> locations,
      @JsonKey(name: 'images') List<String> images});
}

/// @nodoc
class _$CafeCopyWithImpl<$Res> implements $CafeCopyWith<$Res> {
  _$CafeCopyWithImpl(this._value, this._then);

  final Cafe _value;
  // ignore: unused_field
  final $Res Function(Cafe) _then;

  @override
  $Res call({
    Object id = freezed,
    Object status = freezed,
    Object name = freezed,
    Object description = freezed,
    Object imageUrl = freezed,
    Object locations = freezed,
    Object images = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as num,
      status: status == freezed ? _value.status : status as num,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      locations:
          locations == freezed ? _value.locations : locations as List<City>,
      images: images == freezed ? _value.images : images as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$CafeCopyWith<$Res> implements $CafeCopyWith<$Res> {
  factory _$CafeCopyWith(_Cafe value, $Res Function(_Cafe) then) =
      __$CafeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'locations') List<City> locations,
      @JsonKey(name: 'images') List<String> images});
}

/// @nodoc
class __$CafeCopyWithImpl<$Res> extends _$CafeCopyWithImpl<$Res>
    implements _$CafeCopyWith<$Res> {
  __$CafeCopyWithImpl(_Cafe _value, $Res Function(_Cafe) _then)
      : super(_value, (v) => _then(v as _Cafe));

  @override
  _Cafe get _value => super._value as _Cafe;

  @override
  $Res call({
    Object id = freezed,
    Object status = freezed,
    Object name = freezed,
    Object description = freezed,
    Object imageUrl = freezed,
    Object locations = freezed,
    Object images = freezed,
  }) {
    return _then(_Cafe(
      id: id == freezed ? _value.id : id as num,
      status: status == freezed ? _value.status : status as num,
      name: name == freezed ? _value.name : name as String,
      description:
          description == freezed ? _value.description : description as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      locations:
          locations == freezed ? _value.locations : locations as List<City>,
      images: images == freezed ? _value.images : images as List<String>,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_Cafe implements _Cafe {
  const _$_Cafe(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'locations') this.locations,
      @JsonKey(name: 'images') this.images});

  factory _$_Cafe.fromJson(Map<String, dynamic> json) =>
      _$_$_CafeFromJson(json);

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
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @override
  @JsonKey(name: 'locations')
  final List<City> locations;
  @override
  @JsonKey(name: 'images')
  final List<String> images;

  @override
  String toString() {
    return 'Cafe(id: $id, status: $status, name: $name, description: $description, imageUrl: $imageUrl, locations: $locations, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cafe &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.locations, locations) ||
                const DeepCollectionEquality()
                    .equals(other.locations, locations)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(locations) ^
      const DeepCollectionEquality().hash(images);

  @override
  _$CafeCopyWith<_Cafe> get copyWith =>
      __$CafeCopyWithImpl<_Cafe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CafeToJson(this);
  }
}

abstract class _Cafe implements Cafe {
  const factory _Cafe(
      {@JsonKey(name: 'id') num id,
      @JsonKey(name: 'status') num status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'imageUrl') String imageUrl,
      @JsonKey(name: 'locations') List<City> locations,
      @JsonKey(name: 'images') List<String> images}) = _$_Cafe;

  factory _Cafe.fromJson(Map<String, dynamic> json) = _$_Cafe.fromJson;

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
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'imageUrl')
  String get imageUrl;
  @override
  @JsonKey(name: 'locations')
  List<City> get locations;
  @override
  @JsonKey(name: 'images')
  List<String> get images;
  @override
  _$CafeCopyWith<_Cafe> get copyWith;
}
