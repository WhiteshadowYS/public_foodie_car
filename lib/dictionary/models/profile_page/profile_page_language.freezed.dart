// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'profile_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProfilePageLanguage _$ProfilePageLanguageFromJson(Map<String, dynamic> json) {
  return _ProfilePageLanguage.fromJson(json);
}

/// @nodoc
class _$ProfilePageLanguageTearOff {
  const _$ProfilePageLanguageTearOff();

// ignore: unused_element
  _ProfilePageLanguage call(
      {@required String title, @required String yourOrders}) {
    return _ProfilePageLanguage(
      title: title,
      yourOrders: yourOrders,
    );
  }

// ignore: unused_element
  ProfilePageLanguage fromJson(Map<String, Object> json) {
    return ProfilePageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProfilePageLanguage = _$ProfilePageLanguageTearOff();

/// @nodoc
mixin _$ProfilePageLanguage {
  String get title;
  String get yourOrders;

  Map<String, dynamic> toJson();
  $ProfilePageLanguageCopyWith<ProfilePageLanguage> get copyWith;
}

/// @nodoc
abstract class $ProfilePageLanguageCopyWith<$Res> {
  factory $ProfilePageLanguageCopyWith(
          ProfilePageLanguage value, $Res Function(ProfilePageLanguage) then) =
      _$ProfilePageLanguageCopyWithImpl<$Res>;
  $Res call({String title, String yourOrders});
}

/// @nodoc
class _$ProfilePageLanguageCopyWithImpl<$Res>
    implements $ProfilePageLanguageCopyWith<$Res> {
  _$ProfilePageLanguageCopyWithImpl(this._value, this._then);

  final ProfilePageLanguage _value;
  // ignore: unused_field
  final $Res Function(ProfilePageLanguage) _then;

  @override
  $Res call({
    Object title = freezed,
    Object yourOrders = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      yourOrders:
          yourOrders == freezed ? _value.yourOrders : yourOrders as String,
    ));
  }
}

/// @nodoc
abstract class _$ProfilePageLanguageCopyWith<$Res>
    implements $ProfilePageLanguageCopyWith<$Res> {
  factory _$ProfilePageLanguageCopyWith(_ProfilePageLanguage value,
          $Res Function(_ProfilePageLanguage) then) =
      __$ProfilePageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title, String yourOrders});
}

/// @nodoc
class __$ProfilePageLanguageCopyWithImpl<$Res>
    extends _$ProfilePageLanguageCopyWithImpl<$Res>
    implements _$ProfilePageLanguageCopyWith<$Res> {
  __$ProfilePageLanguageCopyWithImpl(
      _ProfilePageLanguage _value, $Res Function(_ProfilePageLanguage) _then)
      : super(_value, (v) => _then(v as _ProfilePageLanguage));

  @override
  _ProfilePageLanguage get _value => super._value as _ProfilePageLanguage;

  @override
  $Res call({
    Object title = freezed,
    Object yourOrders = freezed,
  }) {
    return _then(_ProfilePageLanguage(
      title: title == freezed ? _value.title : title as String,
      yourOrders:
          yourOrders == freezed ? _value.yourOrders : yourOrders as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ProfilePageLanguage implements _ProfilePageLanguage {
  const _$_ProfilePageLanguage(
      {@required this.title, @required this.yourOrders})
      : assert(title != null),
        assert(yourOrders != null);

  factory _$_ProfilePageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_ProfilePageLanguageFromJson(json);

  @override
  final String title;
  @override
  final String yourOrders;

  @override
  String toString() {
    return 'ProfilePageLanguage(title: $title, yourOrders: $yourOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfilePageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.yourOrders, yourOrders) ||
                const DeepCollectionEquality()
                    .equals(other.yourOrders, yourOrders)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(yourOrders);

  @override
  _$ProfilePageLanguageCopyWith<_ProfilePageLanguage> get copyWith =>
      __$ProfilePageLanguageCopyWithImpl<_ProfilePageLanguage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProfilePageLanguageToJson(this);
  }
}

abstract class _ProfilePageLanguage implements ProfilePageLanguage {
  const factory _ProfilePageLanguage(
      {@required String title,
      @required String yourOrders}) = _$_ProfilePageLanguage;

  factory _ProfilePageLanguage.fromJson(Map<String, dynamic> json) =
      _$_ProfilePageLanguage.fromJson;

  @override
  String get title;
  @override
  String get yourOrders;
  @override
  _$ProfilePageLanguageCopyWith<_ProfilePageLanguage> get copyWith;
}
