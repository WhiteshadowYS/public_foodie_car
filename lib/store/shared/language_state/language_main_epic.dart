import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/dictionary/models/supported_language.dart';
import 'package:foodie_client_template/dictionary/models/supported_locales.dart';
import 'package:foodie_client_template/domain/data_services/language_service.dart';
import 'package:foodie_client_template/store/shared/language_state/actions/change_language_action.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';

/// [InitializeMainEpic] the main epic which is started for initialization.
/// The class [InitializeMainEpic], has only one static variable [indexEpic].
/// The variable [indexEpic], returns a sheet of [combineEpics] that stores one epic, [_startInitializationEpic].
class LanguageMainEpic {
  static const String tag = '[LanguageMainEpic]';

  static final indexEpic = combineEpics<AppState>([
    _changeLanguageEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _changeLanguageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ChangeLanguageAction>().switchMap((action) async* {
      final _languageService = dependencyContainer.get<LanguageService>();

      final SupportedLanguage language = SupportedLocales.instance.getSupportedLanguages.firstWhere(
        (element) {
          return element.languageCode == action.locale;
        },
        orElse: () => null,
      );

      if (language != null) {
        await _languageService.saveLanguage(language);
      }
    });
  }
}
