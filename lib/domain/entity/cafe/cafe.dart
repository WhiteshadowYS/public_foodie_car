import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe.g.dart';
part 'cafe.freezed.dart';

@freezed
abstract class Cafe with _$Cafe {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Cafe({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'status') num status,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'imageUrl') String imageUrl,
    @JsonKey(name: 'locations') List<City> locations,
    @JsonKey(name: 'images') List<String> images,
  }) = _Cafe;

  factory Cafe.fromJson(Map json) => _$CafeFromJson(json);
}
