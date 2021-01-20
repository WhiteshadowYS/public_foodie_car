// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Language _$_$_LanguageFromJson(Map<String, dynamic> json) {
  return _$_Language(
    name: json['name'] as String,
    busketPage: json['busketPage'] == null
        ? null
        : BusketPageLanguage.fromJson(
            json['busketPage'] as Map<String, dynamic>),
    productsPage: json['productsPage'] == null
        ? null
        : ProductsPageLanguage.fromJson(
            json['productsPage'] as Map<String, dynamic>),
    productPage: json['productPage'] == null
        ? null
        : ProductPageLanguage.fromJson(
            json['productPage'] as Map<String, dynamic>),
    homePage: json['homePage'] == null
        ? null
        : HomePageLanguage.fromJson(json['homePage'] as Map<String, dynamic>),
    galleryPage: json['galleryPage'] == null
        ? null
        : GalleryPageLanguage.fromJson(
            json['galleryPage'] as Map<String, dynamic>),
    categoriesPage: json['categoriesPage'] == null
        ? null
        : CategoriesPageLanguage.fromJson(
            json['categoriesPage'] as Map<String, dynamic>),
    aboutPage: json['aboutPage'] == null
        ? null
        : AboutPageLanguage.fromJson(json['aboutPage'] as Map<String, dynamic>),
    profilePage: json['profilePage'] == null
        ? null
        : ProfilePageLanguage.fromJson(
            json['profilePage'] as Map<String, dynamic>),
    global: json['global'] == null
        ? null
        : GlobalLanguage.fromJson(json['global'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_LanguageToJson(_$_Language instance) =>
    <String, dynamic>{
      'name': instance.name,
      'busketPage': instance.busketPage,
      'productsPage': instance.productsPage,
      'productPage': instance.productPage,
      'homePage': instance.homePage,
      'galleryPage': instance.galleryPage,
      'categoriesPage': instance.categoriesPage,
      'aboutPage': instance.aboutPage,
      'profilePage': instance.profilePage,
      'global': instance.global,
    };
