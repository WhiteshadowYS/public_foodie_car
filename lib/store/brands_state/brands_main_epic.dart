import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/domain/data_services/brands_service.dart';
import 'package:foodie_client_template/store/brands_state/actions/get_brands_action.dart';
import 'package:foodie_client_template/store/brands_state/actions/save_brands_action.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';

@injectable
class BrandsMainEpic {
  static const String tag = '[InitializeEpics]';

  static final indexEpic = combineEpics<AppState>([
    _getBrandsEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _getBrandsEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetBrandsAction>().switchMap((action) async* {
      final _service = dependencyContainer.get<BrandsService>();

      final result = await _service.getBrands();

      if (result != null && result.isNotEmpty) {
        yield SaveBrandsAction(
          brands: result,
        );
      }
    });
  }
}
