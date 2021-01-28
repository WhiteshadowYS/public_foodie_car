// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_page_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
LoginPageLanguage _$LoginPageLanguageFromJson(Map<String, dynamic> json) {
  return _LoginPageLanguage.fromJson(json);
}

/// @nodoc
class _$LoginPageLanguageTearOff {
  const _$LoginPageLanguageTearOff();

// ignore: unused_element
  _LoginPageLanguage call(
      {@required String title,
      @required String emailHint,
      @required String passwordHint}) {
    return _LoginPageLanguage(
      title: title,
      emailHint: emailHint,
      passwordHint: passwordHint,
    );
  }

// ignore: unused_element
  LoginPageLanguage fromJson(Map<String, Object> json) {
    return LoginPageLanguage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $LoginPageLanguage = _$LoginPageLanguageTearOff();

/// @nodoc
mixin _$LoginPageLanguage {
  String get title;
  String get emailHint;
  String get passwordHint;

  Map<String, dynamic> toJson();
  $LoginPageLanguageCopyWith<LoginPageLanguage> get copyWith;
}

/// @nodoc
abstract class $LoginPageLanguageCopyWith<$Res> {
  factory $LoginPageLanguageCopyWith(
          LoginPageLanguage value, $Res Function(LoginPageLanguage) then) =
      _$LoginPageLanguageCopyWithImpl<$Res>;
  $Res call({String title, String emailHint, String passwordHint});
}

/// @nodoc
class _$LoginPageLanguageCopyWithImpl<$Res>
    implements $LoginPageLanguageCopyWith<$Res> {
  _$LoginPageLanguageCopyWithImpl(this._value, this._then);

  final LoginPageLanguage _value;
  // ignore: unused_field
  final $Res Function(LoginPageLanguage) _then;

  @override
  $Res call({
    Object title = freezed,
    Object emailHint = freezed,
    Object passwordHint = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      emailHint: emailHint == freezed ? _value.emailHint : emailHint as String,
      passwordHint: passwordHint == freezed
          ? _value.passwordHint
          : passwordHint as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginPageLanguageCopyWith<$Res>
    implements $LoginPageLanguageCopyWith<$Res> {
  factory _$LoginPageLanguageCopyWith(
          _LoginPageLanguage value, $Res Function(_LoginPageLanguage) then) =
      __$LoginPageLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String title, String emailHint, String passwordHint});
}

/// @nodoc
class __$LoginPageLanguageCopyWithImpl<$Res>
    extends _$LoginPageLanguageCopyWithImpl<$Res>
    implements _$LoginPageLanguageCopyWith<$Res> {
  __$LoginPageLanguageCopyWithImpl(
      _LoginPageLanguage _value, $Res Function(_LoginPageLanguage) _then)
      : super(_value, (v) => _then(v as _LoginPageLanguage));

  @override
  _LoginPageLanguage get _value => super._value as _LoginPageLanguage;

  @override
  $Res call({
    Object title = freezed,
    Object emailHint = freezed,
    Object passwordHint = freezed,
  }) {
    return _then(_LoginPageLanguage(
      title: title == freezed ? _value.title : title as String,
      emailHint: emailHint == freezed ? _value.emailHint : emailHint as String,
      passwordHint: passwordHint == freezed
          ? _value.passwordHint
          : passwordHint as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_LoginPageLanguage implements _LoginPageLanguage {
  const _$_LoginPageLanguage(
      {@required this.title,
      @required this.emailHint,
      @required this.passwordHint})
      : assert(title != null),
        assert(emailHint != null),
        assert(passwordHint != null);

  factory _$_LoginPageLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginPageLanguageFromJson(json);

  @override
  final String title;
  @override
  final String emailHint;
  @override
  final String passwordHint;

  @override
  String toString() {
    return 'LoginPageLanguage(title: $title, emailHint: $emailHint, passwordHint: $passwordHint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginPageLanguage &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.emailHint, emailHint) ||
                const DeepCollectionEquality()
                    .equals(other.emailHint, emailHint)) &&
            (identical(other.passwordHint, passwordHint) ||
                const DeepCollectionEquality()
                    .equals(other.passwordHint, passwordHint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(emailHint) ^
      const DeepCollectionEquality().hash(passwordHint);

  @override
  _$LoginPageLanguageCopyWith<_LoginPageLanguage> get copyWith =>
      __$LoginPageLanguageCopyWithImpl<_LoginPageLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoginPageLanguageToJson(this);
  }
}

abstract class _LoginPageLanguage implements LoginPageLanguage {
  const factory _LoginPageLanguage(
      {@required String title,
      @required String emailHint,
      @required String passwordHint}) = _$_LoginPageLanguage;

  factory _LoginPageLanguage.fromJson(Map<String, dynamic> json) =
      _$_LoginPageLanguage.fromJson;

  @override
  String get title;
  @override
  String get emailHint;
  @override
  String get passwordHint;
  @override
  _$LoginPageLanguageCopyWith<_LoginPageLanguage> get copyWith;
}
