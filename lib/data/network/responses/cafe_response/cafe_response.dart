import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe_response.g.dart';
part 'cafe_response.freezed.dart';

@freezed
abstract class CafeResponse with _$CafeResponse {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory CafeResponse({
    @JsonKey(name: 'error') String error,
    @JsonKey(name: 'data') List<Cafe> cafeList,
  }) = _CafeResponse;

  factory CafeResponse.fromJson(Map json) => _$CafeResponseFromJson(json);
}
