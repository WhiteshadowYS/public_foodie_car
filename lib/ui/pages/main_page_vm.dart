import 'package:base_project_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  MainPageVM();

  factory MainPageVM.init(Store<AppState> store) {
    return MainPageVM();
  }
}
