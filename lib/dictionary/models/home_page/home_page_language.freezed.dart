// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HomePageLanguage _$HomePageLanguageFromJson(Map<String, dynamic> json) {
  return _HomePageLanguage.fromJson(json);
}

/// @nodoc
class _$HomePageLanguageTearOff {
  const _$HomePageLanguageTearOff();

// ignore: unused_element
  _HomePageLanguage call({@required String title}) {
    return _HomePageLanguage(
      title: title,
    );
  }

// ignore: unused_element
  HomePageLanguage fromJson(Map<String, Object> json) {
    return HomePageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HomePageLanguage = _$HomePageLanguageTearOff();

/// @nodoc
mixin _$HomePageLanguage {
  String get title;

  Map<String, dynamic> toJson();
  $HomePageLanguageCopyWith<HomePageLanguage> get copyWith;
}

/// @nodoc
abstract class $HomePageLanguageCopyWith<$Res> {
  factory $HomePageLanguageCopyWith(
          HomePageLanguage value, $Res Function(HomePageLanguage) then) =
      _$HomePageLanguageCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$HomePageLanguageCopyWithImpl<$Res>
    implements $HomePageLanguageCopyWith<$Res> {
  _$HomePageLanguageCopyWithImpl(this._value, this._then);

  final HomePageLanguage _value;
  // ignore: unused_field
  final $Res Function(HomePageLanguage) _then;

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
abstract class _$HomePageLanguageCopyWith<$Res>
    implements $HomePageLanguageCopyWith<$Res> {
  factory _$HomePageLanguageCopyWith(
          _HomePageLanguage value, $Res Function(_HomePageLanguage) then) =
      __$HomePageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$HomePageLanguageCopyWithImpl<$Res>
    extends _$HomePageLanguageCopyWithImpl<$Res>
    implements _$HomePageLanguageCopyWith<$Res> {
  __$HomePageLanguageCopyWithImpl(
      _HomePageLanguage _value, $Res Function(_HomePageLanguage) _then)
      : super(_value, (v) => _then(v as _HomePageLanguage));

  @override
  _HomePageLanguage get _value => super._value as _HomePageLanguage;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_HomePageLanguage(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HomePageLanguage implements _HomePageLanguage {
  const _$_HomePageLanguage({@required this.title}) : assert(title != null);

  factory _$_HomePageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_HomePageLanguageFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'HomePageLanguage(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomePageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$HomePageLanguageCopyWith<_HomePageLanguage> get copyWith =>
      __$HomePageLanguageCopyWithImpl<_HomePageLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HomePageLanguageToJson(this);
  }
}

abstract class _HomePageLanguage implements HomePageLanguage {
  const factory _HomePageLanguage({@required String title}) =
      _$_HomePageLanguage;

  factory _HomePageLanguage.fromJson(Map<String, dynamic> json) =
      _$_HomePageLanguage.fromJson;

  @override
  String get title;
  @override
  _$HomePageLanguageCopyWith<_HomePageLanguage> get copyWith;
}
