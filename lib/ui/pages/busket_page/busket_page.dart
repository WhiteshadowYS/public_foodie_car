import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/busket_page/busket_page_vm.dart';
import 'package:foodie_client_template/ui/pages/busket_page/widgets/busket_item.dart';

class BusketPage extends StatelessWidget {
  BusketPage({Key key}) : super(key: key);

  final lng = FlutterDictionary.instance.language;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BusketPageVM>(
      converter: BusketPageVM.init,
      builder: (BuildContext context, BusketPageVM vm) {
        return MainLayout(
          key: Key('[BusketPage][MainLayout]'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ...getFixedProductsList(vm.products)
                      ?.map((item) => BusketItem(
                            key: Key('[BusketPage][BusketItem][${item.id}]'),
                            delete: vm.removeFromBusket,
                            product: item,
                          ))
                      ?.toList() ??
                  [],
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 30.0,
                ),
                child: Text(
                  (getItemsPrice(getFixedProductsList(vm.products))?.toString() ?? '') + lng.global.currencyValue,
                  style: CustomTheme.textStyles.accentTextStyle(
                    fontWeight: FontWeight.bold,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Product> getFixedProductsList(List<Product> items) {
    final List<Product> list = [];

    for (Product item in items) {
      final bool check = list.any((element) {
        return element.id == item.id;
      });

      if (!check) {
        list.add(item.copyWith(count: 1));
      } else {
        final Product nItem = list.firstWhere((element) => element.id == item.id);

        list
          ..removeWhere((e) => e.id == item.id)
          ..add(nItem.copyWith(count: nItem.count + 1));
      }
    }

    return list ?? [];
  }

  double getItemsPrice(List<Product> items) {
    if (items == null || items.isEmpty) return 0.0;

    double price = 0;

    for (Product item in items) {
      price += double.tryParse(item?.price ?? 0.0) * item.count;
    }

    return price;
  }
}
