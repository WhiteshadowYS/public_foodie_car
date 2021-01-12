import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/busket_page/busket_page_vm.dart';
import 'package:foodie_client_template/ui/pages/busket_page/widgets/busket_item.dart';

class BusketPage extends StatelessWidget {
  const BusketPage({Key key}) : super(key: key);

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
                ...vm.products
                        ?.map((item) => BusketItem(
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
                    (getItemsPrice(vm.products)?.toString() ?? '') + ' грн',
                    style: CustomTheme.textStyles.accentTextStyle(
                      fontWeight: FontWeight.bold,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  double getItemsPrice(List<Product> items) {
    if (items == null || items.isEmpty) return 0.0;

    double price = 0;

    for (Product item in items) {
      price += item?.price ?? 0.0;
    }

    return price;
  }
}
