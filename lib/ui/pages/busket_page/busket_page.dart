import 'package:flutter/material.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/busket_page/widgets/busket_item.dart';

class BusketPage extends StatelessWidget {
  const BusketPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      key: Key('[BusketPage][MainLayout]'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ..._items.map((item) => BusketItem(delete: () {}, item: item)).toList(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 30.0,
            ),
            child: Text(
              (getItemsPrice(_items)?.toString() ?? '') + ' грн',
              style: CustomTheme.textStyles.accentTextStyle(
                fontWeight: FontWeight.bold,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double getItemsPrice(List<BusketItemModel> items) {
    if (items == null || items.isEmpty) return 0.0;

    double price = 0;

    for (BusketItemModel item in items) {
      price += item?.price ?? 0.0;
    }

    return price;
  }
}

const List<BusketItemModel> _items = [
  BusketItemModel(
    id: 1,
    price: 200,
    name: 'Pizza',
    url: 'https://media.dominos.ua/menu/product_osg_image_mobile/2019/10/03/Royal_Slice_retoch-min-min.jpg',
  ),
  BusketItemModel(
    id: 2,
    price: 100,
    name: 'Pizza 2',
    url: 'https://media.dominos.ua/menu/product_osg_image_mobile/2019/10/03/Royal_Slice_retoch-min-min.jpg',
  ),
  BusketItemModel(
    id: 3,
    price: 300,
    name: 'Pizza 3',
    url: 'https://media.dominos.ua/menu/product_osg_image_mobile/2019/10/03/Royal_Slice_retoch-min-min.jpg',
  ),
];
