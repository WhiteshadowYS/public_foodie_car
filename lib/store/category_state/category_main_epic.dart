import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/domain/data_services/categories_service.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/default_loader_dialog.dart';
import 'package:foodie_client_template/store/cafe_state/actions/get_cafe_for_city.dart';
import 'package:foodie_client_template/store/category_state/actions/get_categories_for_cafe.dart';
import 'package:foodie_client_template/store/category_state/actions/save_categories_for_cafe.dart';
import 'package:foodie_client_template/store/shared/loader/actions/start_loading_action.dart';
import 'package:foodie_client_template/store/shared/loader/actions/stop_loading_action.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';

class CategoryMainEpic {
  static const String tag = '[CategoryMainEpic]';

  static final indexEpic = combineEpics<AppState>([
    _getCategoriesForCafeEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _getCategoriesForCafeEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetCategoriesForCafe>().switchMap((action) async* {
      yield StartLoadingAction(
        loader: DefaultLoaderDialog(
          state: true,
          loaderKey: LoaderKey.global,
        ),
      );

      final _service = dependencyContainer.get<CategoriesService>();

      final Cafe cafe = store.state.cafeState.selectedCafe;

      if (cafe != null) {
        final result = await _service.getCategoriesForCafe(cafe);

        if (result != null && result.isNotEmpty) {
          yield SaveCategoriesForCafe(
            categories: result,
          );
        } else {
          yield SaveCategoriesForCafe(
            categories: [],
          );
        }
      }
      yield StopLoadingAction(loaderKey: LoaderKey.global);
    });
  }
}
