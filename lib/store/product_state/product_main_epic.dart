import 'package:foodie_client_template/domain/functional_services/dialog_service/models/default_loader_dialog.dart';
import 'package:foodie_client_template/store/category_state/actions/get_categories_for_cafe.dart';
import 'package:foodie_client_template/store/product_state/actions/get_products_for_category.dart';
import 'package:foodie_client_template/store/shared/loader/actions/start_loading_action.dart';
import 'package:foodie_client_template/store/shared/loader/actions/stop_loading_action.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/domain/data_services/products_service.dart';
import 'package:foodie_client_template/store/cafe_state/actions/get_cafe_for_city.dart';
import 'package:foodie_client_template/store/product_state/actions/save_products_for_category.dart';

import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';

class ProductMainEpic {
  static const String tag = '[ProductMainEpic]';

  static final indexEpic = combineEpics<AppState>([
    _getProductsForCategoryEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _getProductsForCategoryEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetProductsForCategory>().switchMap((action) async* {
      yield StartLoadingAction(
        loader: DefaultLoaderDialog(
          state: true,
          loaderKey: LoaderKey.global,
        ),
      );

      final _service = dependencyContainer.get<ProductsService>();

      final Cafe cafe = store.state.cafeState.selectedCafe;
      final Category category = store.state.categoryState.selectedCategory;

      if (cafe != null && category != null) {
        print('[ProductMainEpic] => <_getProductsForCategoryEpic> => Cafe and Category not null');
        final result = await _service.getProductsForCategory(cafe, category);
        print('[ProductMainEpic] => <_getProductsForCategoryEpic> => response: $result');

        if (result != null && result.isNotEmpty) {
          yield SaveProductsForCategory(
            products: result,
          );
        } else {
          yield SaveProductsForCategory(
            products: [],
          );
        }
      }

      yield StopLoadingAction(loaderKey: LoaderKey.global);
    });
  }
}
