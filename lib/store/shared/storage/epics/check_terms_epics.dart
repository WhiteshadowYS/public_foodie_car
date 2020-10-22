import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/check_terms_actions/check_terms_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_terms_actions/check_terms_result_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_terms_actions/do_check_terms_action.dart';
import 'package:my_catalog/store/shared/storage/actions/open_store_actions/open_store_action.dart';
import 'package:my_catalog/store/shared/storage/actions/open_terms_actions/open_terms_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class CheckTermsEpics {
  static final indexEpic = combineEpics<AppState>([
    _checkTermsEpic,
    _doCheckTermsEpic,
  ]);

  static Stream<dynamic> _checkTermsEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<CheckTermsAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              DoCheckTermsAction(id: action.id),
            ]),
            ZipStream(<Stream>[
              actions.whereType<CheckTermsResultActon>(),
            ], (values) {
              final CheckTermsResultActon nAction = values.first as CheckTermsResultActon;

              if (nAction.isTermsAccepted) {
                return ConcatEagerStream([
                  Stream.value(
                    OpenStoreAction(
                      id: action.id,
                      storage: action.model.storage,
                    ),
                  ),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              return ConcatEagerStream([
                Stream.value(
                  OpenTermsAction(
                    id: action.id,
                    storage: action.model.storage,
                  ),
                ),
                StorageMainEpic.changeCheckIdLoadingState(value: false),
              ]);
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _doCheckTermsEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoCheckTermsAction>().asyncMap(
      (action) {
        return StorageRepository().getIsTermsAccepted(action.id.toString()).then((bool isTermsAccepted) {
          return CheckTermsResultActon(
            isTermsAccepted: isTermsAccepted,
          );
        });
      },
    );
  }
}
