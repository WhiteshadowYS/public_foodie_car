import 'package:foodie_client_template/data/network/repositories/brands_repository.dart';
import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/basket_state/busket_selector.dart';
import 'package:foodie_client_template/store/brands_state/brands_selector.dart';
import 'package:foodie_client_template/store/shared/language_state/language_selector.dart';
import 'package:redux/redux.dart';

class HomePageVM {
  final String locale;

  final void Function(Product) addToBusket;
  final void Function() getData;

  const HomePageVM({
    this.locale,
    this.addToBusket,
    this.getData,
  });

  static HomePageVM init(Store<AppState> store) {
    return HomePageVM(
      locale: LanguageSelector.getCurrentLocale(store),
      addToBusket: BusketSelector.getAddItemToBusketFunction(store),
      getData: BrandsSelector.getBrandsFunction(store),
    );
  }
}
