import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_page_language.g.dart';
part 'profile_page_language.freezed.dart';

@freezed
abstract class ProfilePageLanguage with _$ProfilePageLanguage {
  @JsonSerializable()
  const factory ProfilePageLanguage({
    @required String title,
    @required String yourOrders,
  }) = _ProfilePageLanguage;

  factory ProfilePageLanguage.fromJson(Map json) => _$ProfilePageLanguageFromJson(json);
}
