// TODO(Yuri): Add comment for each Keys class.

class ApplicationKeys{
  static const String application = 'Application';
}

class CatalogsPageKeys {
  /// Will using with index. For example: CatalogItem1, CatalogItem2, CatalogItem3.
  static const String catalogItem = 'CatalogItem';
}

class CategoriesPageKeys {
  static const String gridView = 'CategoriesGridView';
  static const String appbar = 'CategoriesGridViewAppBar';
  static const String bottomBar = 'CategoriesGridViewBottomBar';
  /// Will using with index. For example: CategoryItem1, CategoryItem2, CategoryItem3.
  static const String categoryItem = 'CategoryItem';
}

class SubCategoriesPageKeys {
  static const String gridView = 'SubCategoriesGridView';
  static const String appbar = 'SubCategoriesGridViewAppBar';
  static const String bottomBar = 'SubCategoriesGridViewBottomBar';
  /// Will using with index. For example: SubCategories1, SubCategories2, SubCategories3.
  static const String subcategoryItem = 'SubCategoriesItem';
}

class MainPageKeys {
  static const String listView = 'MainPageListView';
  /// Will using with index. For example: MainPageCatalogListItem1, MainPageCatalogListItem2, MainPageCatalogListItem3.
  static const String catalogListItem = 'MainPageCatalogListItem';
  static const String textField = 'MainPageIdTextField';
  static const String button = 'MainPageSearchButton';
  static const String ownButton = 'MainPageOwnCatalogButton';
}

class ProductsPageKeys {
  static const String listView = 'ProductsPageListView';
  static const String appbar = 'ProductsPageAppBar';
  static const String bottomBar = 'ProductsPageBottomBar';
  /// Will using with index. For example: ProductItem1, ProductItem2, ProductItem3.
  static const String productItem = 'ProductItem';
}

class SingleProductKeys {
  static const String listView = 'SingleProductListView';
  static const String appbar = 'SingleProductAppBar';
  static const String bottomBar = 'SingleProductBottomBar';
  /// Will using with index. For example: SingleProductFileItem1, SingleProductFileItem2, SingleProductFileItem3.
  static const String fileItem = 'SingleProductFileItem';
  static const String gallery = 'SingleProductGallery';
}

class SettingsPageKeys {
  static const String appbar = 'SettingsPageMainAppBar';
  static const String bottomBar = 'SettingsPageBottomBar';
  static const String listView = 'SettingsPageListView';
  static const String infoBlock = 'SettingsPageInfoBlock';
  static const String pushNotificationsBlock = 'SettingsItemPushNotifications';
  static const String pushNotificationsBlockSwitch = 'SettingsItemPushNotificationsCustomSwitch';
  static const String languageBlock = 'SettingsItemLanguage';
  static const String languageBlockDropdown = 'SettingsItemLanguageLanguageDropdown';
  static const String tacBlock = 'SettingsItemTAC';
  static const String createdByLink = 'SettingsCreateByLink';
}

class TermsPageKeys {
  static const String appbar = 'TermsPageAppBar';
  static const String listView = 'TermsPageListView';
  static const String button = 'TermsPageButton';
}

class DialogKeys {
  static const String exitDialogYesButton = 'YesButton';
  static const String exitDialogNoButton = 'NoButton';
}