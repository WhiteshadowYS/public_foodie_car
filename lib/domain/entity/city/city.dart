import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.g.dart';
part 'city.freezed.dart';

@freezed
abstract class City with _$City {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory City({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'slug') String slug,
  }) = _City;

  factory City.fromJson(Map json) => _$CityFromJson(json);
}
