import 'package:foodie_client_template/store/basket_state/busket_state.dart';
import 'package:foodie_client_template/store/cafe_state/cafe_main_epic.dart';
import 'package:foodie_client_template/store/cafe_state/cafe_state.dart';
import 'package:foodie_client_template/store/category_state/category_main_epic.dart';
import 'package:foodie_client_template/store/category_state/category_state.dart';
import 'package:foodie_client_template/store/city_state/city_main_epic.dart';
import 'package:foodie_client_template/store/city_state/city_state.dart';
import 'package:foodie_client_template/store/product_state/product_main_epic.dart';
import 'package:foodie_client_template/store/product_state/product_state.dart';
import 'package:foodie_client_template/store/profile_state/profile_main_epic.dart';
import 'package:foodie_client_template/store/profile_state/profile_state.dart';
import 'package:foodie_client_template/store/shared/language_state/language_main_epic.dart';
import 'package:foodie_client_template/store/shared/language_state/language_state.dart';
import 'package:flutter/foundation.dart';

import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:foodie_client_template/store/shared/dialog_state/dialog_state.dart';
import 'package:foodie_client_template/store/shared/initialization/initialize_main_epic.dart';

/// Class [AppState], is the main [state] application.
/// It keeps 3, smaller states.
/// Namely, [dialogState], [storageState], [loaderState].
/// First [dialogState], this variable stores the state of dialogs, it is used to call various dialogs.
/// Second [storageState], the primary state, stores all information from all states.
/// The third [loaderState] is required to loading.
class AppState {
  final DialogState dialogState;
  final LoaderState loaderState;
  final LanguageState languageState;
  final BusketState busketState;
  final CityState cityState;
  final ProductState productState;
  final CafeState cafeState;
  final CategoryState categoryState;
  final ProfileState profileState;

  AppState({
    @required this.dialogState,
    @required this.loaderState,
    @required this.languageState,
    @required this.busketState,
    @required this.cityState,
    @required this.productState,
    @required this.cafeState,
    @required this.categoryState,
    @required this.profileState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      languageState: LanguageState.initial(),
      dialogState: DialogState.initial(),
      loaderState: LoaderState.initial(),
      busketState: BusketState.initial(),
      cityState: CityState.initial(),
      productState: ProductState.initial(),
      cafeState: CafeState.initial(),
      categoryState: CategoryState.initial(),
      profileState: ProfileState.initial(),
    );
  }

  ///The [getReducer] function is the main Reducer in which you call Reducer, all other states.
  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      dialogState: state.dialogState.reducer(action),
      loaderState: state.loaderState.reducer(action),
      languageState: state.languageState.reducer(action),
      busketState: state.busketState.reducer(action),
      cityState: state.cityState.reducer(action),
      productState: state.productState.reducer(action),
      cafeState: state.cafeState.reducer(action),
      categoryState: state.categoryState.reducer(action),
      profileState: state.profileState.reducer(action),
    );
  }

  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([
    InitializeMainEpic.indexEpic,
    CityMainEpic.indexEpic,
    CategoryMainEpic.indexEpic,
    CafeMainEpic.indexEpic,
    ProductMainEpic.indexEpic,
    LanguageMainEpic.indexEpic,
    ProfileMainEpic.indexEpic,
  ]);
}
