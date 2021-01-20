import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_response.g.dart';
part 'city_response.freezed.dart';

@freezed
abstract class CityResponse with _$CityResponse {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory CityResponse({
    @JsonKey(name: 'error') String error,
    @JsonKey(name: 'data') List<City> cityList,
  }) = _CityResponse;

  factory CityResponse.fromJson(Map json) => _$CityResponseFromJson(json);
}
