import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/actions/open_store_actions/do_open_store_action.dart';
import 'package:my_catalog/store/shared/storage/actions/open_store_actions/open_store_action.dart';
import 'package:my_catalog/store/shared/storage/actions/open_store_actions/open_store_result_action.dart';
import 'package:my_catalog/store/shared/storage/actions/set_opened_id_actions.dart';
import 'package:my_catalog/store/shared/storage/actions/update_is_first_open_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class OpenStoreEpics {
  static final indexEpic = combineEpics<AppState>([
    _openStoreEpic,
    _doOpenStoreEpic,
  ]);

  static Stream<dynamic> _openStoreEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<OpenStoreAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              DoOpenStoreAction(
                id: action.id,
                storage: action.storage,
              ),
            ]),
            ZipStream(<Stream>[
              actions.whereType<OpenStoreResultAction>(),
            ], (values) {
              final OpenStoreResultAction nAction = values.first as OpenStoreResultAction;
              final String lastRoute = RouteService.instance.currentRoute;

              if (lastRoute == Routes.main || lastRoute == Routes.terms || lastRoute == null) {
                return _routeStream(nAction.isFirstOpen, action.storage);
              }
              return Stream.value(
                UpdateIsFirstOpenAction(isFirstOpen: nAction.isFirstOpen),
              );
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _routeStream(bool isFirstOpen, StorageModel model) {
    return ConcatEagerStream([
      Stream.value(
        UpdateIsFirstOpenAction(isFirstOpen: isFirstOpen),
      ),
      if (model.data?.hierarchy != null && model.data?.hierarchy?.length == 1)
        Stream.fromIterable([
          SetOpenedCatalogIdAction(id: model?.data?.hierarchy?.first?.id),
          RouteSelectors.gotoCategoriesPageAction
        ])
      else
        Stream.value(RouteSelectors.gotoCatalogsPageAction),
    ]);
  }

  static Stream<dynamic> _doOpenStoreEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoOpenStoreAction>().asyncMap(
      (action) {
        return StorageRepository().getIsFirstOpen(action.id.toString()).then((bool isFirstOpen) {
          return OpenStoreResultAction(
            isFirstOpen: isFirstOpen,
          );
        });
      },
    );
  }
}
