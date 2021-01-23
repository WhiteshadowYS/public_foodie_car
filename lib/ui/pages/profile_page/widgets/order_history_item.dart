import 'package:flutter/material.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/domain/entity/order/order.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';

class OrderHistoryItem extends StatelessWidget {
  final Order order;

  OrderHistoryItem({
    Key key,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: CustomTheme.colors.background,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.24),
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 4.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: order.products.map((product) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.restourant,
                style: CustomTheme.textStyles.accentTextStyle(
                  color: CustomTheme.colors.primaryColor,
                  fontWeight: FontWeight.bold,
                  size: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    product.title,
                  ),
                  Spacer(),
                  Text(
                    product.price,
                    style: CustomTheme.textStyles.accentTextStyle(
                      color: CustomTheme.colors.accentColor,
                      fontWeight: FontWeight.bold,
                      size: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          );
        }).toList(),
      ),
    );
  }
}
