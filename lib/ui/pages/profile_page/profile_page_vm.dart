import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/order/order.dart';
import 'package:foodie_client_template/store/city_state/city_selector.dart';
import 'package:foodie_client_template/store/profile_state/profile_selector.dart';
import 'package:foodie_client_template/store/shared/dialog_state/dialog_selector.dart';
import 'package:foodie_client_template/store/shared/language_state/language_selector.dart';
import 'package:foodie_client_template/store/shared/loader/loader_selectors.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/store/application/app_state.dart';

class ProfilePageVM {
  final bool isLoading;
  final String selectedLanguageName;
  final String selectedCityName;
  final List<Order> orders;

  final void Function() openLanguageDialog;
  final void Function() openCityDialog;
  final void Function() getOrdersHistory;

  const ProfilePageVM({
    @required this.isLoading,
    @required this.selectedCityName,
    @required this.selectedLanguageName,
    @required this.openCityDialog,
    @required this.openLanguageDialog,
    @required this.getOrdersHistory,
    @required this.orders,
  });

  static ProfilePageVM init(Store<AppState> store) {
    return ProfilePageVM(
      isLoading: LoaderSelectors.getValueForLoadingKey(store, LoaderKey.global),
      openCityDialog: DialogSelectors.getShowCityDialogFunction(store),
      openLanguageDialog: DialogSelectors.getShowLanguageDialogFunction(store),
      selectedCityName: CitySelector.getSelectedCityName(store),
      selectedLanguageName: LanguageSelector.getSelectedLanguageName(store),
      getOrdersHistory: ProfileSelector.getLoadOrdersFunction(store),
      orders: ProfileSelector.getOrders(store),
    );
  }
}
