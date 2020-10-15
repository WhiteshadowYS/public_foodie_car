import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class CatalogsPageVM {
  final void Function(int) navigateToCategoriesPage;
  final void Function(String message) errorDialog;
  final CatalogModel Function(int) getCurrentCatalogData;
  final List<InfoCatalogModel> catalogs;

  const CatalogsPageVM({
    @required this.navigateToCategoriesPage,
    @required this.errorDialog,
    @required this.catalogs,
    @required this.getCurrentCatalogData,
  });

  static CatalogsPageVM fromStore(Store<AppState> store) {
    return CatalogsPageVM(
      navigateToCategoriesPage: RouteSelectors.gotoCategoriesPage(store),
      errorDialog: DialogSelectors.getShowErrorDialogFunction(store),
      catalogs: StorageSelector.getInfoCatalogs(store),
      getCurrentCatalogData: StorageSelector.getCurrentCatalogModelFunction(store),
    );
  }

  static final List<CatalogModel> _tmpCatalog = <CatalogModel>[
    CatalogModel(
      id: 1,
      imageLink: 'https://zakazposterov.ru/fotooboi/z/fotooboi-e-47590-pop-art-pin-ap-devushka-soset-chupa-chups-zakazposterov-ru_z.jpg',
      languages: <String, dynamic>{
        'HE': {
          'name': 'Tester 1',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
        'EN': {
          'name': 'Tester 1',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
      },
    ),
    CatalogModel(
      id: 1,
      imageLink: 'https://abc-decor.com/img/gallery/21/thumbs/thumb_l_2657.jpg',
      languages: <String, dynamic>{
        'HE': {
          'name': 'Tester 2',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
        'EN': {
          'name': 'Tester 2',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
      },
    ),
    CatalogModel(
      id: 1,
      imageLink: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQtwZzmybeTFgXMs-PCNF_fN0P2uNmW-TBsuw&usqp=CAU',
      languages: <String, dynamic>{
        'HE': {
          'name': 'Tester 3',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
        'EN': {
          'name': 'Tester 3',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
      },
    ),
    CatalogModel(
      id: 1,
      imageLink: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTlGxZ99mfO6lsAjapjS9lWqdMOJwerH6F3FQ&usqp=CAU',
      languages: <String, dynamic>{
        'HE': {
          'name': 'Tester 4',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
        'EN': {
          'name': 'Tester 4',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
      },
    ),
    CatalogModel(
      id: 1,
      imageLink: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGe15NTzCRBMdrBGFAjMKRpDZhArrQCnlywg&usqp=CAU',
      languages: <String, dynamic>{
        'HE': {
          'name': 'Tester 5',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
        'EN': {
          'name': 'Tester 5',
          'description':
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        },
      },
    ),
  ];
}
