// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'busket_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BusketPageLanguage _$BusketPageLanguageFromJson(Map<String, dynamic> json) {
  return _BusketPageLanguage.fromJson(json);
}

/// @nodoc
class _$BusketPageLanguageTearOff {
  const _$BusketPageLanguageTearOff();

// ignore: unused_element
  _BusketPageLanguage call({@required String title}) {
    return _BusketPageLanguage(
      title: title,
    );
  }

// ignore: unused_element
  BusketPageLanguage fromJson(Map<String, Object> json) {
    return BusketPageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BusketPageLanguage = _$BusketPageLanguageTearOff();

/// @nodoc
mixin _$BusketPageLanguage {
  String get title;

  Map<String, dynamic> toJson();
  $BusketPageLanguageCopyWith<BusketPageLanguage> get copyWith;
}

/// @nodoc
abstract class $BusketPageLanguageCopyWith<$Res> {
  factory $BusketPageLanguageCopyWith(
          BusketPageLanguage value, $Res Function(BusketPageLanguage) then) =
      _$BusketPageLanguageCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$BusketPageLanguageCopyWithImpl<$Res>
    implements $BusketPageLanguageCopyWith<$Res> {
  _$BusketPageLanguageCopyWithImpl(this._value, this._then);

  final BusketPageLanguage _value;
  // ignore: unused_field
  final $Res Function(BusketPageLanguage) _then;

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
abstract class _$BusketPageLanguageCopyWith<$Res>
    implements $BusketPageLanguageCopyWith<$Res> {
  factory _$BusketPageLanguageCopyWith(
          _BusketPageLanguage value, $Res Function(_BusketPageLanguage) then) =
      __$BusketPageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$BusketPageLanguageCopyWithImpl<$Res>
    extends _$BusketPageLanguageCopyWithImpl<$Res>
    implements _$BusketPageLanguageCopyWith<$Res> {
  __$BusketPageLanguageCopyWithImpl(
      _BusketPageLanguage _value, $Res Function(_BusketPageLanguage) _then)
      : super(_value, (v) => _then(v as _BusketPageLanguage));

  @override
  _BusketPageLanguage get _value => super._value as _BusketPageLanguage;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_BusketPageLanguage(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BusketPageLanguage implements _BusketPageLanguage {
  const _$_BusketPageLanguage({@required this.title}) : assert(title != null);

  factory _$_BusketPageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_BusketPageLanguageFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'BusketPageLanguage(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BusketPageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$BusketPageLanguageCopyWith<_BusketPageLanguage> get copyWith =>
      __$BusketPageLanguageCopyWithImpl<_BusketPageLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BusketPageLanguageToJson(this);
  }
}

abstract class _BusketPageLanguage implements BusketPageLanguage {
  const factory _BusketPageLanguage({@required String title}) =
      _$_BusketPageLanguage;

  factory _BusketPageLanguage.fromJson(Map<String, dynamic> json) =
      _$_BusketPageLanguage.fromJson;

  @override
  String get title;
  @override
  _$BusketPageLanguageCopyWith<_BusketPageLanguage> get copyWith;
}
