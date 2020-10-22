import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/update_is_first_open_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class UpdateIsFirstOpenEpics {
  static final indexEpic = combineEpics<AppState>([
    _updateIsFirstOpenEpic,
  ]);

  static Stream<dynamic> _updateIsFirstOpenEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateIsFirstOpenAction>().asyncMap(
      (action) {
        return StorageRepository().saveIsFirstOpen(
          id: store.state?.storageState?.openedStoreId?.toString(),
          isFirstOpen: action.isFirstOpen,
        );
      },
    );
  }
}
