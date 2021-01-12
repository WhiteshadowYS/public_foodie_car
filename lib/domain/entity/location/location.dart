import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';
part 'location.freezed.dart';

@freezed
abstract class Location with _$Location {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Location({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'slug') String slug,
  }) = _Location;

  factory Location.fromJson(Map json) => _$LocationFromJson(json);
}
