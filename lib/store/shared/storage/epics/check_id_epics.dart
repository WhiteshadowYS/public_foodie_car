import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/dialog_service/models/internet_connection_dialog.dart';
import 'package:my_catalog/services/internet_connection_service/internet_connection_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/res/consts.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/show_dialog_action.dart';
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

              return Stream.fromIterable([
                CheckUpdateAction(
                  model: nAction.response?.response ?? StorageStatusModel(
                    update: null,
                    id: action.id,
                  ),
                  error: nAction.response?.error,
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
      (action) async {
        final BaseHttpResponse response = await InternetConnectionService.checkInternetConnection();

        if (response?.error != null) {
          return CheckIdResultAction(
            response: BaseHttpResponse<StorageStatusModel>(
              error: response.error,
            ),
          );
        }

        return StorageRepository().getStorageStatus(id: action.id).then((response) {
          return CheckIdResultAction(response: response);
        });
      },
    );
  }
}
