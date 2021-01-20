import 'package:foodie_client_template/store/cafe_state/actions/get_cafe_for_city.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/cafe_state/actions/select_cafe_action.dart';
import 'package:foodie_client_template/store/cafe_state/actions/unselect_cafe_action.dart';

abstract class CafeSelector {
  static List<Cafe> getCafeList(Store<AppState> store) {
    return store.state.cafeState?.cafeList ?? [];
  }

  static Cafe getSelectedCafe(Store<AppState> store) {
    return store.state.cafeState.selectedCafe;
  }

  static void Function() getCafeForCity(Store<AppState> store) {
    return () => store.dispatch(GetCafeForCity());
  }

  static void Function() getUnselectCafeFunction(Store<AppState> store) {
    return () => store.dispatch(UnselectCafeAction());
  }

  static void Function(Cafe) getSelectCafeFunction(Store<AppState> store) {
    return (Cafe cafe) {
      store.dispatch(
        SelectCafeAction(
          cafe: cafe,
        ),
      );
    };
  }
}
