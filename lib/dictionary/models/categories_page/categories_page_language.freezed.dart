// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'categories_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CategoriesPageLanguage _$CategoriesPageLanguageFromJson(
    Map<String, dynamic> json) {
  return _CategoriesPageLanguage.fromJson(json);
}

/// @nodoc
class _$CategoriesPageLanguageTearOff {
  const _$CategoriesPageLanguageTearOff();

// ignore: unused_element
  _CategoriesPageLanguage call({@required String title}) {
    return _CategoriesPageLanguage(
      title: title,
    );
  }

// ignore: unused_element
  CategoriesPageLanguage fromJson(Map<String, Object> json) {
    return CategoriesPageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CategoriesPageLanguage = _$CategoriesPageLanguageTearOff();

/// @nodoc
mixin _$CategoriesPageLanguage {
  String get title;

  Map<String, dynamic> toJson();
  $CategoriesPageLanguageCopyWith<CategoriesPageLanguage> get copyWith;
}

/// @nodoc
abstract class $CategoriesPageLanguageCopyWith<$Res> {
  factory $CategoriesPageLanguageCopyWith(CategoriesPageLanguage value,
          $Res Function(CategoriesPageLanguage) then) =
      _$CategoriesPageLanguageCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$CategoriesPageLanguageCopyWithImpl<$Res>
    implements $CategoriesPageLanguageCopyWith<$Res> {
  _$CategoriesPageLanguageCopyWithImpl(this._value, this._then);

  final CategoriesPageLanguage _value;
  // ignore: unused_field
  final $Res Function(CategoriesPageLanguage) _then;

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
abstract class _$CategoriesPageLanguageCopyWith<$Res>
    implements $CategoriesPageLanguageCopyWith<$Res> {
  factory _$CategoriesPageLanguageCopyWith(_CategoriesPageLanguage value,
          $Res Function(_CategoriesPageLanguage) then) =
      __$CategoriesPageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$CategoriesPageLanguageCopyWithImpl<$Res>
    extends _$CategoriesPageLanguageCopyWithImpl<$Res>
    implements _$CategoriesPageLanguageCopyWith<$Res> {
  __$CategoriesPageLanguageCopyWithImpl(_CategoriesPageLanguage _value,
      $Res Function(_CategoriesPageLanguage) _then)
      : super(_value, (v) => _then(v as _CategoriesPageLanguage));

  @override
  _CategoriesPageLanguage get _value => super._value as _CategoriesPageLanguage;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_CategoriesPageLanguage(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CategoriesPageLanguage implements _CategoriesPageLanguage {
  const _$_CategoriesPageLanguage({@required this.title})
      : assert(title != null);

  factory _$_CategoriesPageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoriesPageLanguageFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'CategoriesPageLanguage(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoriesPageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$CategoriesPageLanguageCopyWith<_CategoriesPageLanguage> get copyWith =>
      __$CategoriesPageLanguageCopyWithImpl<_CategoriesPageLanguage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoriesPageLanguageToJson(this);
  }
}

abstract class _CategoriesPageLanguage implements CategoriesPageLanguage {
  const factory _CategoriesPageLanguage({@required String title}) =
      _$_CategoriesPageLanguage;

  factory _CategoriesPageLanguage.fromJson(Map<String, dynamic> json) =
      _$_CategoriesPageLanguage.fromJson;

  @override
  String get title;
  @override
  _$CategoriesPageLanguageCopyWith<_CategoriesPageLanguage> get copyWith;
}
