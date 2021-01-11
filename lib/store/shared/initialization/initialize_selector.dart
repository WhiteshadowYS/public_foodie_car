import 'package:foodie_client_template/data/res/locales.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';
import 'package:redux/redux.dart';

abstract class InitializeSelectors {
  static void startInitialization(Store<AppState> store) {
    FlutterDictionary.instance.setNewLanguage(Locales.base);
    return store.dispatch(StartInitialization());
  }
}
