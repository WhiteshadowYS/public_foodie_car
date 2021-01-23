import 'package:flutter/material.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/cafe_state/cafe_selector.dart';
import 'package:redux/redux.dart';

class AboutPageVM {
  final String cafeLocation;
  final String cafePhone;
  final String cafeDescription;

  const AboutPageVM({
    @required this.cafeLocation,
    @required this.cafePhone,
    @required this.cafeDescription,
  });

  static AboutPageVM init(Store<AppState> store) {
    return AboutPageVM(
      cafeLocation: CafeSelector.getCafeLocation(store),
      cafeDescription: CafeSelector.getCafeDescription(store),
      cafePhone: CafeSelector.getCafePhone(store),
    );
  }
}
