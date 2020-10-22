import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/check_id_actions/check_id_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_id_actions/check_id_result_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_id_actions/do_check_id_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_update_actions/check_update_action.dart';
import 'package:my_catalog/store/shared/storage/actions/subscribe_to_stores_updates_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class CheckIdEpics {
  static final indexEpic = combineEpics<AppState>([
    _checkIdEpic,
    _doCheckIdEpic,
  ]);

  static Stream<dynamic> _checkIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<CheckIdAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              DoCheckIdAction(id: action.id),
            ]),
            ZipStream(<Stream>[
              actions.whereType<CheckIdResultAction>(),
            ], (values) {
              final CheckIdResultAction nAction = values.first as CheckIdResultAction;

              if (nAction.response.error != null || nAction.response.response == null) {
                return ConcatEagerStream([
                  StorageMainEpic.showError(nAction.response.error?.error ?? 'Error not found'),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              return Stream.fromIterable([
                CheckUpdateAction(
                  model: nAction.response.response,
                ),
                SubscribeToStoresUpdatesAction(
                  id: action.id,
                  getData: action.getData,
                ),
              ]);
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _doCheckIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoCheckIdAction>().asyncMap(
      (action) {
        return StorageRepository().getStorageStatus(id: action.id).then((response) {
          return CheckIdResultAction(response: response);
        });
      },
    );
  }
}
