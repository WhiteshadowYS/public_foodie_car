import 'package:my_catalog/services/firebase_service/firebase_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/subscribe_to_stores_updates_action.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class SubscribeToStoresUpdatesEpics {
  static final indexEpic = combineEpics<AppState>([
    _subscribeToStoresUpdatesEpic,
  ]);

  static Stream<dynamic> _subscribeToStoresUpdatesEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<SubscribeToStoresUpdatesAction>().asyncMap(
      (action) {
        FirebaseService.instance.listenChanges(action.id, action.getData);
        return EmptyAction();
      },
    );
  }
}
