import 'package:flutter/material.dart';

class Language {
  final String name;
  final Locale locale;

  final String homePageTitle;
  final String galleryPageTitle;
  final String categoriesPageTitle;
  final String aboutPageTitle;
  final String subCategoriesPageTitle;
  final String splashScreenTitle;

  const Language({
    this.name,
    this.locale,
    this.aboutPageTitle,
    this.categoriesPageTitle,
    this.galleryPageTitle,
    this.homePageTitle,
    this.splashScreenTitle,
    this.subCategoriesPageTitle,
  });
}
