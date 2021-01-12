// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
class _$LanguageTearOff {
  const _$LanguageTearOff();

// ignore: unused_element
  _Language call(
      {String name,
      String homePageTitle,
      String galleryPageTitle,
      String categoriesPageTitle,
      String aboutPageTitle,
      String busketPageTitle,
      String splashScreenTitle}) {
    return _Language(
      name: name,
      homePageTitle: homePageTitle,
      galleryPageTitle: galleryPageTitle,
      categoriesPageTitle: categoriesPageTitle,
      aboutPageTitle: aboutPageTitle,
      busketPageTitle: busketPageTitle,
      splashScreenTitle: splashScreenTitle,
    );
  }

// ignore: unused_element
  Language fromJson(Map<String, Object> json) {
    return Language.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Language = _$LanguageTearOff();

/// @nodoc
mixin _$Language {
  String get name;
  String get homePageTitle;
  String get galleryPageTitle;
  String get categoriesPageTitle;
  String get aboutPageTitle;
  String get busketPageTitle;
  String get splashScreenTitle;

  Map<String, dynamic> toJson();
  $LanguageCopyWith<Language> get copyWith;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String homePageTitle,
      String galleryPageTitle,
      String categoriesPageTitle,
      String aboutPageTitle,
      String busketPageTitle,
      String splashScreenTitle});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res> implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  final Language _value;
  // ignore: unused_field
  final $Res Function(Language) _then;

  @override
  $Res call({
    Object name = freezed,
    Object homePageTitle = freezed,
    Object galleryPageTitle = freezed,
    Object categoriesPageTitle = freezed,
    Object aboutPageTitle = freezed,
    Object busketPageTitle = freezed,
    Object splashScreenTitle = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      homePageTitle: homePageTitle == freezed
          ? _value.homePageTitle
          : homePageTitle as String,
      galleryPageTitle: galleryPageTitle == freezed
          ? _value.galleryPageTitle
          : galleryPageTitle as String,
      categoriesPageTitle: categoriesPageTitle == freezed
          ? _value.categoriesPageTitle
          : categoriesPageTitle as String,
      aboutPageTitle: aboutPageTitle == freezed
          ? _value.aboutPageTitle
          : aboutPageTitle as String,
      busketPageTitle: busketPageTitle == freezed
          ? _value.busketPageTitle
          : busketPageTitle as String,
      splashScreenTitle: splashScreenTitle == freezed
          ? _value.splashScreenTitle
          : splashScreenTitle as String,
    ));
  }
}

/// @nodoc
abstract class _$LanguageCopyWith<$Res> implements $LanguageCopyWith<$Res> {
  factory _$LanguageCopyWith(_Language value, $Res Function(_Language) then) =
      __$LanguageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String homePageTitle,
      String galleryPageTitle,
      String categoriesPageTitle,
      String aboutPageTitle,
      String busketPageTitle,
      String splashScreenTitle});
}

/// @nodoc
class __$LanguageCopyWithImpl<$Res> extends _$LanguageCopyWithImpl<$Res>
    implements _$LanguageCopyWith<$Res> {
  __$LanguageCopyWithImpl(_Language _value, $Res Function(_Language) _then)
      : super(_value, (v) => _then(v as _Language));

  @override
  _Language get _value => super._value as _Language;

  @override
  $Res call({
    Object name = freezed,
    Object homePageTitle = freezed,
    Object galleryPageTitle = freezed,
    Object categoriesPageTitle = freezed,
    Object aboutPageTitle = freezed,
    Object busketPageTitle = freezed,
    Object splashScreenTitle = freezed,
  }) {
    return _then(_Language(
      name: name == freezed ? _value.name : name as String,
      homePageTitle: homePageTitle == freezed
          ? _value.homePageTitle
          : homePageTitle as String,
      galleryPageTitle: galleryPageTitle == freezed
          ? _value.galleryPageTitle
          : galleryPageTitle as String,
      categoriesPageTitle: categoriesPageTitle == freezed
          ? _value.categoriesPageTitle
          : categoriesPageTitle as String,
      aboutPageTitle: aboutPageTitle == freezed
          ? _value.aboutPageTitle
          : aboutPageTitle as String,
      busketPageTitle: busketPageTitle == freezed
          ? _value.busketPageTitle
          : busketPageTitle as String,
      splashScreenTitle: splashScreenTitle == freezed
          ? _value.splashScreenTitle
          : splashScreenTitle as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Language implements _Language {
  const _$_Language(
      {this.name,
      this.homePageTitle,
      this.galleryPageTitle,
      this.categoriesPageTitle,
      this.aboutPageTitle,
      this.busketPageTitle,
      this.splashScreenTitle});

  factory _$_Language.fromJson(Map<String, dynamic> json) =>
      _$_$_LanguageFromJson(json);

  @override
  final String name;
  @override
  final String homePageTitle;
  @override
  final String galleryPageTitle;
  @override
  final String categoriesPageTitle;
  @override
  final String aboutPageTitle;
  @override
  final String busketPageTitle;
  @override
  final String splashScreenTitle;

  @override
  String toString() {
    return 'Language(name: $name, homePageTitle: $homePageTitle, galleryPageTitle: $galleryPageTitle, categoriesPageTitle: $categoriesPageTitle, aboutPageTitle: $aboutPageTitle, busketPageTitle: $busketPageTitle, splashScreenTitle: $splashScreenTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Language &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.homePageTitle, homePageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.homePageTitle, homePageTitle)) &&
            (identical(other.galleryPageTitle, galleryPageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.galleryPageTitle, galleryPageTitle)) &&
            (identical(other.categoriesPageTitle, categoriesPageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.categoriesPageTitle, categoriesPageTitle)) &&
            (identical(other.aboutPageTitle, aboutPageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.aboutPageTitle, aboutPageTitle)) &&
            (identical(other.busketPageTitle, busketPageTitle) ||
                const DeepCollectionEquality()
                    .equals(other.busketPageTitle, busketPageTitle)) &&
            (identical(other.splashScreenTitle, splashScreenTitle) ||
                const DeepCollectionEquality()
                    .equals(other.splashScreenTitle, splashScreenTitle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(homePageTitle) ^
      const DeepCollectionEquality().hash(galleryPageTitle) ^
      const DeepCollectionEquality().hash(categoriesPageTitle) ^
      const DeepCollectionEquality().hash(aboutPageTitle) ^
      const DeepCollectionEquality().hash(busketPageTitle) ^
      const DeepCollectionEquality().hash(splashScreenTitle);

  @override
  _$LanguageCopyWith<_Language> get copyWith =>
      __$LanguageCopyWithImpl<_Language>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LanguageToJson(this);
  }
}

abstract class _Language implements Language {
  const factory _Language(
      {String name,
      String homePageTitle,
      String galleryPageTitle,
      String categoriesPageTitle,
      String aboutPageTitle,
      String busketPageTitle,
      String splashScreenTitle}) = _$_Language;

  factory _Language.fromJson(Map<String, dynamic> json) = _$_Language.fromJson;

  @override
  String get name;
  @override
  String get homePageTitle;
  @override
  String get galleryPageTitle;
  @override
  String get categoriesPageTitle;
  @override
  String get aboutPageTitle;
  @override
  String get busketPageTitle;
  @override
  String get splashScreenTitle;
  @override
  _$LanguageCopyWith<_Language> get copyWith;
}
