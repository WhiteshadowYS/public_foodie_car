// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {@required @JsonKey(name: 'аго') String photoUrl,
      @required @JsonKey(name: 'name') String name,
      @required @JsonKey(name: 'surname') String surname,
      @required @JsonKey(name: 'email') String email,
      @required @JsonKey(name: 'phone') String phone,
      @required @JsonKey(name: 'test') String bogdan}) {
    return _User(
      photoUrl: photoUrl,
      name: name,
      surname: surname,
      email: email,
      phone: phone,
      bogdan: bogdan,
    );
  }

// ignore: unused_element
  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @JsonKey(name: 'аго')
  String get photoUrl;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'surname')
  String get surname;
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'phone')
  String get phone;
  @JsonKey(name: 'test')
  String get bogdan;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'аго') String photoUrl,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'surname') String surname,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'test') String bogdan});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object photoUrl = freezed,
    Object name = freezed,
    Object surname = freezed,
    Object email = freezed,
    Object phone = freezed,
    Object bogdan = freezed,
  }) {
    return _then(_value.copyWith(
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      name: name == freezed ? _value.name : name as String,
      surname: surname == freezed ? _value.surname : surname as String,
      email: email == freezed ? _value.email : email as String,
      phone: phone == freezed ? _value.phone : phone as String,
      bogdan: bogdan == freezed ? _value.bogdan : bogdan as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'аго') String photoUrl,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'surname') String surname,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'test') String bogdan});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object photoUrl = freezed,
    Object name = freezed,
    Object surname = freezed,
    Object email = freezed,
    Object phone = freezed,
    Object bogdan = freezed,
  }) {
    return _then(_User(
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      name: name == freezed ? _value.name : name as String,
      surname: surname == freezed ? _value.surname : surname as String,
      email: email == freezed ? _value.email : email as String,
      phone: phone == freezed ? _value.phone : phone as String,
      bogdan: bogdan == freezed ? _value.bogdan : bogdan as String,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.kebab, checked: true, explicitToJson: true)

/// @nodoc
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {@required @JsonKey(name: 'аго') this.photoUrl,
      @required @JsonKey(name: 'name') this.name,
      @required @JsonKey(name: 'surname') this.surname,
      @required @JsonKey(name: 'email') this.email,
      @required @JsonKey(name: 'phone') this.phone,
      @required @JsonKey(name: 'test') this.bogdan})
      : assert(photoUrl != null),
        assert(name != null),
        assert(surname != null),
        assert(email != null),
        assert(phone != null),
        assert(bogdan != null);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  @JsonKey(name: 'аго')
  final String photoUrl;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'surname')
  final String surname;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'test')
  final String bogdan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(photoUrl: $photoUrl, name: $name, surname: $surname, email: $email, phone: $phone, bogdan: $bogdan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('surname', surname))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('bogdan', bogdan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.surname, surname) ||
                const DeepCollectionEquality()
                    .equals(other.surname, surname)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.bogdan, bogdan) ||
                const DeepCollectionEquality().equals(other.bogdan, bogdan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(surname) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(bogdan);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {@required @JsonKey(name: 'аго') String photoUrl,
      @required @JsonKey(name: 'name') String name,
      @required @JsonKey(name: 'surname') String surname,
      @required @JsonKey(name: 'email') String email,
      @required @JsonKey(name: 'phone') String phone,
      @required @JsonKey(name: 'test') String bogdan}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'аго')
  String get photoUrl;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'surname')
  String get surname;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(name: 'test')
  String get bogdan;
  @override
  _$UserCopyWith<_User> get copyWith;
}
