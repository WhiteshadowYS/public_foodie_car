// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'about_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AboutPageLanguage _$AboutPageLanguageFromJson(Map<String, dynamic> json) {
  return _AboutPageLanguage.fromJson(json);
}

/// @nodoc
class _$AboutPageLanguageTearOff {
  const _$AboutPageLanguageTearOff();

// ignore: unused_element
  _AboutPageLanguage call({@required String title}) {
    return _AboutPageLanguage(
      title: title,
    );
  }

// ignore: unused_element
  AboutPageLanguage fromJson(Map<String, Object> json) {
    return AboutPageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AboutPageLanguage = _$AboutPageLanguageTearOff();

/// @nodoc
mixin _$AboutPageLanguage {
  String get title;

  Map<String, dynamic> toJson();
  $AboutPageLanguageCopyWith<AboutPageLanguage> get copyWith;
}

/// @nodoc
abstract class $AboutPageLanguageCopyWith<$Res> {
  factory $AboutPageLanguageCopyWith(
          AboutPageLanguage value, $Res Function(AboutPageLanguage) then) =
      _$AboutPageLanguageCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$AboutPageLanguageCopyWithImpl<$Res>
    implements $AboutPageLanguageCopyWith<$Res> {
  _$AboutPageLanguageCopyWithImpl(this._value, this._then);

  final AboutPageLanguage _value;
  // ignore: unused_field
  final $Res Function(AboutPageLanguage) _then;

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
abstract class _$AboutPageLanguageCopyWith<$Res>
    implements $AboutPageLanguageCopyWith<$Res> {
  factory _$AboutPageLanguageCopyWith(
          _AboutPageLanguage value, $Res Function(_AboutPageLanguage) then) =
      __$AboutPageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$AboutPageLanguageCopyWithImpl<$Res>
    extends _$AboutPageLanguageCopyWithImpl<$Res>
    implements _$AboutPageLanguageCopyWith<$Res> {
  __$AboutPageLanguageCopyWithImpl(
      _AboutPageLanguage _value, $Res Function(_AboutPageLanguage) _then)
      : super(_value, (v) => _then(v as _AboutPageLanguage));

  @override
  _AboutPageLanguage get _value => super._value as _AboutPageLanguage;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_AboutPageLanguage(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AboutPageLanguage implements _AboutPageLanguage {
  const _$_AboutPageLanguage({@required this.title}) : assert(title != null);

  factory _$_AboutPageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_AboutPageLanguageFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'AboutPageLanguage(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AboutPageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$AboutPageLanguageCopyWith<_AboutPageLanguage> get copyWith =>
      __$AboutPageLanguageCopyWithImpl<_AboutPageLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AboutPageLanguageToJson(this);
  }
}

abstract class _AboutPageLanguage implements AboutPageLanguage {
  const factory _AboutPageLanguage({@required String title}) =
      _$_AboutPageLanguage;

  factory _AboutPageLanguage.fromJson(Map<String, dynamic> json) =
      _$_AboutPageLanguage.fromJson;

  @override
  String get title;
  @override
  _$AboutPageLanguageCopyWith<_AboutPageLanguage> get copyWith;
}
