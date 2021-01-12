import 'package:foodie_client_template/domain/entity/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.g.dart';
part 'brand.freezed.dart';

@freezed
abstract class Brand with _$Brand {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Brand({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'status') num status,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'locations') List<Location> locations,
  }) = _Brand;

  factory Brand.fromJson(Map json) => _$BrandFromJson(json);
}
