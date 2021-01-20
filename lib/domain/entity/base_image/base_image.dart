import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_image.g.dart';
part 'base_image.freezed.dart';

@freezed
abstract class BaseImage with _$BaseImage {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory BaseImage({
    @JsonKey(name: 'small_image_url') String smallImageUrl,
    @JsonKey(name: 'medium_image_url') String mediumImageUrl,
    @JsonKey(name: 'large_image_url') String largeImageUrl,
    @JsonKey(name: 'original_image_url') String originalImageUrl,
  }) = _BaseImage;

  factory BaseImage.fromJson(Map json) => _$BaseImageFromJson(json);
}
