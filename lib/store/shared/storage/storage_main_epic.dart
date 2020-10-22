import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/dialog_service/models/empty_loader_dialog.dart';
import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
import 'package:my_catalog/services/firebase_service/firebase_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:my_catalog/store/shared/loader/actions/start_loading_action.dart';
import 'package:my_catalog/store/shared/loader/actions/stop_loading_action.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/actions/check_id_actions/check_id_action.dart';
import 'package:my_catalog/store/shared/storage/actions/get_data_actions/get_data_action.dart';
import 'package:my_catalog/store/shared/storage/actions/open_store_actions/open_store_action.dart';
import 'package:my_catalog/store/shared/storage/actions/open_terms_actions/open_terms_action.dart';
import 'package:my_catalog/store/shared/storage/actions/remove_opened_storage_action.dart';
import 'package:my_catalog/store/shared/storage/actions/set_opened_id_actions.dart';
import 'package:my_catalog/store/shared/storage/actions/set_stores_history_actions/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_accepted_terms_actions/update_accepted_terms_id_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_is_first_open_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/update_language_action.dart';
import 'package:my_catalog/store/shared/storage/epics/check_id_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/check_terms_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/check_update_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/get_data_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/open_store_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/open_terms_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/reload_stores_history_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/remove_opened_storage_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/subscribe_to_stores_updates_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/update_acepted_terms_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/update_is_first_open_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/update_language_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/update_opened_store_id_epics.dart';
import 'package:my_catalog/store/shared/storage/epics/update_stores_history_epics.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

// TODO(Yuri): Add comment for this class.
// TODO(Yuri): Move storage state to shared folder.
class StorageMainEpic {
  static final indexEpic = combineEpics<AppState>([
    SubscribeToStoresUpdatesEpics.indexEpic,
    GetDataEpics.indexEpic,
    OpenStoreEpics.indexEpic,
    OpenTermsEpics.indexEpic,
    CheckIdEpics.indexEpic,
    CheckTermsEpics.indexEpic,
    CheckUpdateEpics.indexEpic,
    UpdateLanguageEpics.indexEpic,
    UpdateIsFirstOpenEpics.indexEpic,
    UpdateAcceptedTermsEpics.indexEpic,
    UpdateOpenedStoreIdEpics.indexEpic,
    UpdateStoresHistoryEpics.indexEpic,
    ReloadStoresHistoryEpics.indexEpic,
    RemoveOpenedStorageEpics.indexEpic,
  ]);

  static Stream<dynamic> showError(String errorText) {
    return Stream.value(
      ShowDialogAction(
        dialog: ErrorDialog(
          message: errorText,
        ),
      ),
    );
  }

  static Stream<dynamic> changeCheckIdLoadingState({bool value}) {
    if (value) {
      return Stream.value(StartLoadingAction(
        loader: EmptyLoaderDialog(
          state: true,
          loaderKey: LoaderKey.checkIdLoading,
        ),
      ));
    }

    return Stream.value(StopLoadingAction(
      loaderKey: LoaderKey.checkIdLoading,
    ));
  }
}
