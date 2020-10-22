import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/update_opened_store_id_actions/update_opened_store_id_action.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class UpdateOpenedStoreIdEpics {
  static final indexEpic = combineEpics<AppState>([
    _updateOpenedStoreIdEpic,
  ]);

  static Stream<dynamic> _updateOpenedStoreIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateOpenedStoreIdAction>().asyncMap(
      (action) {
        return StorageRepository().updateOpenedStoreId(id: action.id).then((value) {
          return EmptyAction();
        });
      },
    );
  }
}
