import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/update_language_action.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class UpdateLanguageEpics {
  static final indexEpic = combineEpics<AppState>([
    _updateLanguageEpic,
  ]);

  static Stream<dynamic> _updateLanguageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateLanguageAction>().asyncMap(
      (action) async {
        await StorageRepository().updateStoresHistory(
          id: action.newModel.id,
          locale: action.newModel.locale,
          storageModel: action.newModel.storage,
          update: action.newModel.update,
        );

        return EmptyAction();
      },
    );
  }
}
