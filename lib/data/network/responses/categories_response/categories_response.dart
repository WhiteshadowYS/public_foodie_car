import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response.g.dart';
part 'categories_response.freezed.dart';

@freezed
abstract class CategoriesResponse with _$CategoriesResponse {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory CategoriesResponse({
    @JsonKey(name: 'error') String error,
    @JsonKey(name: 'data') List<Category> categories,
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map json) => _$CategoriesResponseFromJson(json);
}
