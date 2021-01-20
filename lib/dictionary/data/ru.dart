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

const Language ru = Language(
  name: 'Russian',
  global: GlobalLanguage(
    noNameText: 'Без Имени',
    buyButtonText: 'Купить',
    buttonOkText: 'Ок',
    buttonErrorText: 'Отмена',
    errorTitle: 'Ошибка',
    descriptionTitle: 'Описание',
    languageTitle: 'Выберете язык',
    cityTitle: 'Выберете город',
    currecyTitle: 'Цена: ',
    currencyValue: ' грн',
    weightTitle: 'Вес: ',
    weightValue: 'г',
  ),
  profilePage: ProfilePageLanguage(
    title: 'Профиль',
    yourOrders: 'Выши заказы',
  ),
  homePage: HomePageLanguage(
    title: 'Добро пожаловать!',
  ),
  galleryPage: GalleryPageLanguage(
    title: 'Галлерея',
  ),
  categoriesPage: CategoriesPageLanguage(
    title: 'Категории продуктов',
  ),
  aboutPage: AboutPageLanguage(
    title: 'О Нас!',
  ),
  busketPage: BusketPageLanguage(
    title: 'Корзина',
  ),
  productPage: ProductPageLanguage(
    title: '',
  ),
  productsPage: ProductsPageLanguage(
    title: 'Продукты',
  ),
);
