import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/profile_page/profile_page_vm.dart';
import 'package:foodie_client_template/ui/pages/profile_page/widgets/order_history_item.dart';
import 'package:foodie_client_template/ui/widgets/app_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage() : super(key: Key('[ProfilePage]'));

  final lng = FlutterDictionary.instance.language;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfilePageVM>(
      converter: ProfilePageVM.init,
      onInitialBuild: (vm) => vm.getOrdersHistory(),
      builder: (BuildContext context, ProfilePageVM vm) {
        return MainLayout(
          key: Key('[ProfilePage][MainLayout][Key]'),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              children: [
                AppButton(
                  key: Key(key.toString() + '[SelectLanguage]'),
                  onTap: vm.openLanguageDialog,
                  child: Text(
                    vm.selectedLanguageName,
                    style: CustomTheme.textStyles.buttonTextStyle(),
                  ),
                ),
                const SizedBox(height: 24.0),
                AppButton(
                  key: Key(key.toString() + '[SelectCity]'),
                  onTap: vm.openCityDialog,
                  child: Text(
                    vm.selectedCityName,
                    style: CustomTheme.textStyles.buttonTextStyle(),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  lng.profilePage.yourOrders,
                  style: CustomTheme.textStyles.mainTextStyle(
                    size: 24.0,
                  ),
                ),
                Column(
                  children: vm.orders.map((order) {
                    return OrderHistoryItem(
                      order: order,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
