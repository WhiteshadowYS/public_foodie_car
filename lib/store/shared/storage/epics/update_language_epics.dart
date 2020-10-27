import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/update_token_status_model.dart';
import 'package:my_catalog/repositories/notifications_repository.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/set_stores_history_actions/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/do_update_lagnuage_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/update_language_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/update_language_result_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_token_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class UpdateLanguageEpics {
  static final indexEpic = combineEpics<AppState>([
    _updateLanguageEpic,
    _doUpdateLanguageEpic,
    _updatePushTokenEpic,
  ]);

  static Stream<dynamic> _updateLanguageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateLanguageAction>().switchMap(
      (action) {
        return ConcatStream([
          Stream.fromIterable([
            UpdateTokenAction(
              id: action.newModel.id,
              language: action.newModel.locale,
            ),
            DoUpdateLanguageAction(
              newModel: action.newModel,
            ),
          ]),
          ZipStream(<Stream>[
            actions.whereType<UpdateLanguageResultAction>(),
          ], (values) {
            final UpdateLanguageResultAction nAction = values.first as UpdateLanguageResultAction;

            return Stream.value(
              SetStoresHistoryAction(
                storesHistory: nAction.history,
              ),
            );
          }).switchMap((action) => action),
        ]);
      },
    );
  }

  static Stream<dynamic> _updatePushTokenEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateTokenAction>().switchMap(
      (action) async* {
        final NotificationsRepository repository = NotificationsRepository();
        final BaseHttpResponse<UpdateTokenStatusModel> response = await repository.updateToken(
          id: action.id,
          language: action.language,
        );
        if (response.error != null || response.response == null) {
          yield* StorageMainEpic.showError(response.error?.error ?? 'Error not found');
        }
        return;
      },
    );
  }

  static Stream<dynamic> _doUpdateLanguageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoUpdateLanguageAction>().asyncMap(
      (action) async {
        await StorageRepository().updateStoresHistory(
          id: action.newModel.id,
          locale: action.newModel.locale,
          storageModel: action.newModel.storage,
          update: action.newModel.update,
        );

        final List<SavedStorageModel> history = await StorageRepository().getStoresHistory();

        return UpdateLanguageResultAction(
          history: history,
        );
      },
    );
  }
}
