import 'package:foodie_client_template/dictionary/models/about_page/about_page_language.dart';
import 'package:foodie_client_template/dictionary/models/busket_page/busket_page_language.dart';
import 'package:foodie_client_template/dictionary/models/categories_page/categories_page_language.dart';
import 'package:foodie_client_template/dictionary/models/gallery_page/gallery_page_language.dart';
import 'package:foodie_client_template/dictionary/models/global/global_language.dart';
import 'package:foodie_client_template/dictionary/models/home_page/home_page_language.dart';
import 'package:foodie_client_template/dictionary/models/product_page/product_page_language.dart';
import 'package:foodie_client_template/dictionary/models/products_page/products_page_language.dart';
import 'package:foodie_client_template/dictionary/models/profile_page/profile_page_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.g.dart';
part 'language.freezed.dart';

@freezed
abstract class Language with _$Language {
  @JsonSerializable()
  const factory Language({
    @required String name,
    @required BusketPageLanguage busketPage,
    @required ProductsPageLanguage productsPage,
    @required ProductPageLanguage productPage,
    @required HomePageLanguage homePage,
    @required GalleryPageLanguage galleryPage,
    @required CategoriesPageLanguage categoriesPage,
    @required AboutPageLanguage aboutPage,
    @required ProfilePageLanguage profilePage,
    @required GlobalLanguage global,
  }) = _Language;

  factory Language.fromJson(Map json) => _$LanguageFromJson(json);
}
