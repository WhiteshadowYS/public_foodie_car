// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'gallery_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GalleryPageLanguage _$GalleryPageLanguageFromJson(Map<String, dynamic> json) {
  return _GalleryPageLanguage.fromJson(json);
}

/// @nodoc
class _$GalleryPageLanguageTearOff {
  const _$GalleryPageLanguageTearOff();

// ignore: unused_element
  _GalleryPageLanguage call({@required String title}) {
    return _GalleryPageLanguage(
      title: title,
    );
  }

// ignore: unused_element
  GalleryPageLanguage fromJson(Map<String, Object> json) {
    return GalleryPageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GalleryPageLanguage = _$GalleryPageLanguageTearOff();

/// @nodoc
mixin _$GalleryPageLanguage {
  String get title;

  Map<String, dynamic> toJson();
  $GalleryPageLanguageCopyWith<GalleryPageLanguage> get copyWith;
}

/// @nodoc
abstract class $GalleryPageLanguageCopyWith<$Res> {
  factory $GalleryPageLanguageCopyWith(
          GalleryPageLanguage value, $Res Function(GalleryPageLanguage) then) =
      _$GalleryPageLanguageCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$GalleryPageLanguageCopyWithImpl<$Res>
    implements $GalleryPageLanguageCopyWith<$Res> {
  _$GalleryPageLanguageCopyWithImpl(this._value, this._then);

  final GalleryPageLanguage _value;
  // ignore: unused_field
  final $Res Function(GalleryPageLanguage) _then;

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
abstract class _$GalleryPageLanguageCopyWith<$Res>
    implements $GalleryPageLanguageCopyWith<$Res> {
  factory _$GalleryPageLanguageCopyWith(_GalleryPageLanguage value,
          $Res Function(_GalleryPageLanguage) then) =
      __$GalleryPageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$GalleryPageLanguageCopyWithImpl<$Res>
    extends _$GalleryPageLanguageCopyWithImpl<$Res>
    implements _$GalleryPageLanguageCopyWith<$Res> {
  __$GalleryPageLanguageCopyWithImpl(
      _GalleryPageLanguage _value, $Res Function(_GalleryPageLanguage) _then)
      : super(_value, (v) => _then(v as _GalleryPageLanguage));

  @override
  _GalleryPageLanguage get _value => super._value as _GalleryPageLanguage;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_GalleryPageLanguage(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GalleryPageLanguage implements _GalleryPageLanguage {
  const _$_GalleryPageLanguage({@required this.title}) : assert(title != null);

  factory _$_GalleryPageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_GalleryPageLanguageFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'GalleryPageLanguage(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryPageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$GalleryPageLanguageCopyWith<_GalleryPageLanguage> get copyWith =>
      __$GalleryPageLanguageCopyWithImpl<_GalleryPageLanguage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GalleryPageLanguageToJson(this);
  }
}

abstract class _GalleryPageLanguage implements GalleryPageLanguage {
  const factory _GalleryPageLanguage({@required String title}) =
      _$_GalleryPageLanguage;

  factory _GalleryPageLanguage.fromJson(Map<String, dynamic> json) =
      _$_GalleryPageLanguage.fromJson;

  @override
  String get title;
  @override
  _$GalleryPageLanguageCopyWith<_GalleryPageLanguage> get copyWith;
}
