import 'package:foodie_client_template/dictionary/models/about_page/about_page_language.dart';
import 'package:foodie_client_template/dictionary/models/busket_page/busket_page_language.dart';
import 'package:foodie_client_template/dictionary/models/categories_page/categories_page_language.dart';
import 'package:foodie_client_template/dictionary/models/gallery_page/gallery_page_language.dart';
import 'package:foodie_client_template/dictionary/models/global/global_language.dart';
import 'package:foodie_client_template/dictionary/models/home_page/home_page_language.dart';
import 'package:foodie_client_template/dictionary/models/language.dart';
import 'package:foodie_client_template/dictionary/models/product_page/product_page_language.dart';
import 'package:foodie_client_template/dictionary/models/products_page/products_page_language.dart';
import 'package:foodie_client_template/dictionary/models/profile_page/profile_page_language.dart';

const Language en = Language(
  name: 'English',
  global: GlobalLanguage(
    noNameText: 'No Name',
    buyButtonText: 'Buy',
    buttonOkText: 'Ok',
    buttonErrorText: 'Cancel',
    errorTitle: 'Error',
    descriptionTitle: 'Description',
    languageTitle: 'Select your Language',
    cityTitle: 'Select your City',
    currecyTitle: 'Price: ',
    currencyValue: ' UAH',
    weightTitle: 'Weight: ',
    weightValue: 'g',
  ),
  profilePage: ProfilePageLanguage(
    title: 'Profile',
    yourOrders: 'Your Orders',
  ),
  homePage: HomePageLanguage(
    title: 'Welcome!',
  ),
  galleryPage: GalleryPageLanguage(
    title: 'Gallery',
  ),
  categoriesPage: CategoriesPageLanguage(
    title: 'Select the Category!',
  ),
  aboutPage: AboutPageLanguage(
    title: 'About Us',
  ),
  busketPage: BusketPageLanguage(
    title: 'Your Busket',
  ),
  productPage: ProductPageLanguage(
    title: '',
  ),
  productsPage: ProductsPageLanguage(
    title: 'Products',
  ),
);
