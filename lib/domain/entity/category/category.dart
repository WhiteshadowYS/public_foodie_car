import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Category({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'status') num status,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'image_url') String imageUrl,
  }) = _Category;

  factory Category.fromJson(Map json) => _$CategoryFromJson(json);
}
