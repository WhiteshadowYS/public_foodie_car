import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/remove_opened_storage_action.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class RemoveOpenedStorageEpics {
  static final indexEpic = combineEpics<AppState>([
    _removeOpenedStorageEpic,
  ]);

  static Stream<dynamic> _removeOpenedStorageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RemoveOpenedStorageAction>().asyncMap((action) async {
      await StorageRepository().removeOpenedStoreId();
      return EmptyAction();
    });
  }
}