// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'base_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BaseImage _$BaseImageFromJson(Map<String, dynamic> json) {
  return _BaseImage.fromJson(json);
}

/// @nodoc
class _$BaseImageTearOff {
  const _$BaseImageTearOff();

// ignore: unused_element
  _BaseImage call(
      {@JsonKey(name: 'small_image_url') String smallImageUrl,
      @JsonKey(name: 'medium_image_url') String mediumImageUrl,
      @JsonKey(name: 'large_image_url') String largeImageUrl,
      @JsonKey(name: 'original_image_url') String originalImageUrl}) {
    return _BaseImage(
      smallImageUrl: smallImageUrl,
      mediumImageUrl: mediumImageUrl,
      largeImageUrl: largeImageUrl,
      originalImageUrl: originalImageUrl,
    );
  }

// ignore: unused_element
  BaseImage fromJson(Map<String, Object> json) {
    return BaseImage.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BaseImage = _$BaseImageTearOff();

/// @nodoc
mixin _$BaseImage {
  @JsonKey(name: 'small_image_url')
  String get smallImageUrl;
  @JsonKey(name: 'medium_image_url')
  String get mediumImageUrl;
  @JsonKey(name: 'large_image_url')
  String get largeImageUrl;
  @JsonKey(name: 'original_image_url')
  String get originalImageUrl;

  Map<String, dynamic> toJson();
  $BaseImageCopyWith<BaseImage> get copyWith;
}

/// @nodoc
abstract class $BaseImageCopyWith<$Res> {
  factory $BaseImageCopyWith(BaseImage value, $Res Function(BaseImage) then) =
      _$BaseImageCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'small_image_url') String smallImageUrl,
      @JsonKey(name: 'medium_image_url') String mediumImageUrl,
      @JsonKey(name: 'large_image_url') String largeImageUrl,
      @JsonKey(name: 'original_image_url') String originalImageUrl});
}

/// @nodoc
class _$BaseImageCopyWithImpl<$Res> implements $BaseImageCopyWith<$Res> {
  _$BaseImageCopyWithImpl(this._value, this._then);

  final BaseImage _value;
  // ignore: unused_field
  final $Res Function(BaseImage) _then;

  @override
  $Res call({
    Object smallImageUrl = freezed,
    Object mediumImageUrl = freezed,
    Object largeImageUrl = freezed,
    Object originalImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      smallImageUrl: smallImageUrl == freezed
          ? _value.smallImageUrl
          : smallImageUrl as String,
      mediumImageUrl: mediumImageUrl == freezed
          ? _value.mediumImageUrl
          : mediumImageUrl as String,
      largeImageUrl: largeImageUrl == freezed
          ? _value.largeImageUrl
          : largeImageUrl as String,
      originalImageUrl: originalImageUrl == freezed
          ? _value.originalImageUrl
          : originalImageUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$BaseImageCopyWith<$Res> implements $BaseImageCopyWith<$Res> {
  factory _$BaseImageCopyWith(
          _BaseImage value, $Res Function(_BaseImage) then) =
      __$BaseImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'small_image_url') String smallImageUrl,
      @JsonKey(name: 'medium_image_url') String mediumImageUrl,
      @JsonKey(name: 'large_image_url') String largeImageUrl,
      @JsonKey(name: 'original_image_url') String originalImageUrl});
}

/// @nodoc
class __$BaseImageCopyWithImpl<$Res> extends _$BaseImageCopyWithImpl<$Res>
    implements _$BaseImageCopyWith<$Res> {
  __$BaseImageCopyWithImpl(_BaseImage _value, $Res Function(_BaseImage) _then)
      : super(_value, (v) => _then(v as _BaseImage));

  @override
  _BaseImage get _value => super._value as _BaseImage;

  @override
  $Res call({
    Object smallImageUrl = freezed,
    Object mediumImageUrl = freezed,
    Object largeImageUrl = freezed,
    Object originalImageUrl = freezed,
  }) {
    return _then(_BaseImage(
      smallImageUrl: smallImageUrl == freezed
          ? _value.smallImageUrl
          : smallImageUrl as String,
      mediumImageUrl: mediumImageUrl == freezed
          ? _value.mediumImageUrl
          : mediumImageUrl as String,
      largeImageUrl: largeImageUrl == freezed
          ? _value.largeImageUrl
          : largeImageUrl as String,
      originalImageUrl: originalImageUrl == freezed
          ? _value.originalImageUrl
          : originalImageUrl as String,
    ));
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, checked: true, explicitToJson: true)

/// @nodoc
class _$_BaseImage implements _BaseImage {
  const _$_BaseImage(
      {@JsonKey(name: 'small_image_url') this.smallImageUrl,
      @JsonKey(name: 'medium_image_url') this.mediumImageUrl,
      @JsonKey(name: 'large_image_url') this.largeImageUrl,
      @JsonKey(name: 'original_image_url') this.originalImageUrl});

  factory _$_BaseImage.fromJson(Map<String, dynamic> json) =>
      _$_$_BaseImageFromJson(json);

  @override
  @JsonKey(name: 'small_image_url')
  final String smallImageUrl;
  @override
  @JsonKey(name: 'medium_image_url')
  final String mediumImageUrl;
  @override
  @JsonKey(name: 'large_image_url')
  final String largeImageUrl;
  @override
  @JsonKey(name: 'original_image_url')
  final String originalImageUrl;

  @override
  String toString() {
    return 'BaseImage(smallImageUrl: $smallImageUrl, mediumImageUrl: $mediumImageUrl, largeImageUrl: $largeImageUrl, originalImageUrl: $originalImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BaseImage &&
            (identical(other.smallImageUrl, smallImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.smallImageUrl, smallImageUrl)) &&
            (identical(other.mediumImageUrl, mediumImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.mediumImageUrl, mediumImageUrl)) &&
            (identical(other.largeImageUrl, largeImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.largeImageUrl, largeImageUrl)) &&
            (identical(other.originalImageUrl, originalImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.originalImageUrl, originalImageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(smallImageUrl) ^
      const DeepCollectionEquality().hash(mediumImageUrl) ^
      const DeepCollectionEquality().hash(largeImageUrl) ^
      const DeepCollectionEquality().hash(originalImageUrl);

  @override
  _$BaseImageCopyWith<_BaseImage> get copyWith =>
      __$BaseImageCopyWithImpl<_BaseImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BaseImageToJson(this);
  }
}

abstract class _BaseImage implements BaseImage {
  const factory _BaseImage(
          {@JsonKey(name: 'small_image_url') String smallImageUrl,
          @JsonKey(name: 'medium_image_url') String mediumImageUrl,
          @JsonKey(name: 'large_image_url') String largeImageUrl,
          @JsonKey(name: 'original_image_url') String originalImageUrl}) =
      _$_BaseImage;

  factory _BaseImage.fromJson(Map<String, dynamic> json) =
      _$_BaseImage.fromJson;

  @override
  @JsonKey(name: 'small_image_url')
  String get smallImageUrl;
  @override
  @JsonKey(name: 'medium_image_url')
  String get mediumImageUrl;
  @override
  @JsonKey(name: 'large_image_url')
  String get largeImageUrl;
  @override
  @JsonKey(name: 'original_image_url')
  String get originalImageUrl;
  @override
  _$BaseImageCopyWith<_BaseImage> get copyWith;
}
