import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/actions/open_terms_actions/open_terms_action.dart';
import 'package:my_catalog/store/shared/storage/actions/set_opened_id_actions.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class OpenTermsEpics {
  static final indexEpic = combineEpics<AppState>([
    _openTermsEpics,
  ]);

  static Stream<dynamic> _openTermsEpics(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<OpenTermsAction>().switchMap((action) {
      final String lastRoute = RouteService.instance.currentRoute;

      if (lastRoute == Routes.main || lastRoute == null) {
        return ConcatStream([
          Stream.value(SetOpenedCatalogIdAction(id: action.id)),
          Stream.value(RouteSelectors.gotoTermsPageAction),
        ]);
      }

      return Stream.value(EmptyAction());
    });
  }
}
