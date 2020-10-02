import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class StorageEpics {
  static final indexEpic = combineEpics<AppState>([
    getDataEpic,
  ]);

  static Stream<dynamic> getDataEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetDataAction>().switchMap((action) {
      return Stream.fromFuture(
        // TODO(Yura Shevelev): Fix storageId, https://url.net
        StorageRepository().getStorageData(storageId: '').then((StorageModel model) {
          print('Storage Model: ${model.toJson()}');
          return EmptyAction();
        }),
      );
    });
  }
}
