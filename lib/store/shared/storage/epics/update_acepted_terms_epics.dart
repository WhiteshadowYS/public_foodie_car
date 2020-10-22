import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/open_store_actions/open_store_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_accepted_terms_actions/update_accepted_terms_id_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class UpdateAcceptedTermsEpics {
  static final indexEpic = combineEpics<AppState>([
    _updateAcceptedTermsEpic,
  ]);

  static Stream<dynamic> _updateAcceptedTermsEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateAcceptedTermsIdAction>().switchMap((action) async* {
      await StorageRepository().saveIsTermsAccepted(action.id.toString());

      yield* ConcatEagerStream([
        Stream.value(
          OpenStoreAction(
            id: action.id,
            storage: action.storage,
          ),
        ),
        StorageMainEpic.changeCheckIdLoadingState(value: false),
      ]);
    });
  }
}
