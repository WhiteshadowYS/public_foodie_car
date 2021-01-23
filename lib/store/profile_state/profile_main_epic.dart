import 'package:foodie_client_template/domain/entity/base_image/base_image.dart';
import 'package:foodie_client_template/domain/entity/order/order.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/default_loader_dialog.dart';
import 'package:foodie_client_template/store/category_state/actions/get_categories_for_cafe.dart';
import 'package:foodie_client_template/store/product_state/actions/get_products_for_category.dart';
import 'package:foodie_client_template/store/profile_state/actions/get_order_history.dart';
import 'package:foodie_client_template/store/profile_state/actions/save_order_history.dart';
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

class ProfileMainEpic {
  static const String tag = '[ProfileMainEpic]';

  static final indexEpic = combineEpics<AppState>([
    _getOrdersEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _getOrdersEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetOrderHistory>().switchMap((action) async* {
      yield StartLoadingAction(
        loader: DefaultLoaderDialog(
          state: true,
          loaderKey: LoaderKey.global,
        ),
      );

      final _service = dependencyContainer.get<ProductsService>();

      yield SaveOrderHistory(orders: _data);

      yield StopLoadingAction(loaderKey: LoaderKey.global);
    });
  }
}

const List<Order> _data = [
  Order(
    id: 0,
    products: [
      Product(
        id: 0,
        restourant: 'KFC',
        title: 'Margarita',
        price: '100',
        baseImage: BaseImage(
          mediumImageUrl: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        ),
      ),
      Product(
        id: 1,
        restourant: 'KFC',
        title: 'Margarita',
        price: '100',
        baseImage: BaseImage(
          mediumImageUrl: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        ),
      ),
      Product(
        id: 2,
        restourant: 'Mac',
        title: 'Margarita',
        price: '200',
        baseImage: BaseImage(
          mediumImageUrl: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        ),
        count: 2,
      ),
    ],
  ),
  Order(
    id: 1,
    products: [
      Product(
        id: 3,
        restourant: 'Mac',
        title: 'Margarita',
        price: '100',
        baseImage: BaseImage(
          mediumImageUrl: 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
        ),
        count: 2,
      ),
    ],
  ),
];
