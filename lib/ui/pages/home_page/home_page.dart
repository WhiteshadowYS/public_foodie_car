import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/choose_language_dialog.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/home_page/home_page_vm.dart';
import 'package:foodie_client_template/ui/pages/home_page/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: StoreConnector<AppState, HomePageVM>(
        converter: HomePageVM.init,
        onInitialBuild: (vm) => vm.getData(),
        builder: (BuildContext context, HomePageVM vm) {
          return MainLayout(
            key: Key('[HomePage]'),
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  key: Key('[ProductItem][$index]'),
                  buyFunction: vm.addToBusket,
                  product: Product(
                    id: index,
                    title: 'Бургер #$index',
                    description: 'Я самый вкусный бургер',
                    price: (index + 1) * 100,
                    weight: 100,
                    imageUrl: 'https://ambar.net.ua/image/data/2398.jpg',
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
