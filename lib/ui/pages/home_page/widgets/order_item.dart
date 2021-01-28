import 'package:flutter/material.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:foodie_car_template/store/orders_state/orders_state.dart';
import 'package:foodie_car_template/ui/widgets/app_button.dart';
import 'package:foodie_car_template/utils/launch_browser.dart';
import 'package:maps/maps.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderItem extends StatefulWidget {
  final OrdersMenuState status;
  final Order order;
  final void Function(Order) startOrder;
  final void Function(Order) closeOrder;
  final void Function(String) openPhoneDialog;
  final void Function(String) openMapDialog;

  OrderItem({
    @required this.order,
    this.status = OrdersMenuState.opened,
    this.openMapDialog,
    this.openPhoneDialog,
    this.startOrder,
    this.closeOrder,
  });

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isOpened = false;

  final lng = FlutterDictionary.instance.language;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _isOpened = !_isOpened),
        child: AnimatedContainer(
          margin: const EdgeInsets.all(8.0),
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          height: _isOpened ? 180.0 : 100.0,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2.5,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(widget.order?.imageUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.order?.name ?? '',
                    style: CustomTheme.textStyles.accentTextStyle(
                      size: 20.0,
                      color: CustomTheme.colors.font,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  _buildStatusWidget(),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: _isOpened ? 300 : 0),
                height: _isOpened ? 40.0 : 0.0,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 63.0,
                          child: Text(
                            lng.homePage.startText,
                            style: CustomTheme.textStyles.accentTextStyle(
                              size: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.order?.startAddress ?? '',
                            style: CustomTheme.textStyles.mainTextStyle(),
                          ),
                        ),
                        InkWell(
                          onTap: () async => openMapWithAddress(widget.order.startAddress),
                          child: Icon(
                            Icons.navigation,
                            color: CustomTheme.colors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        InkWell(
                          onTap: () => widget.openPhoneDialog(widget.order?.startPhone),
                          child: Icon(
                            Icons.phone,
                            color: CustomTheme.colors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Icon(
                          Icons.query_builder,
                          color: CustomTheme.colors.font,
                        ),
                        const SizedBox(width: 4.0),
                        SizedBox(
                          width: 50.0,
                          child: Text(
                            widget.order.startTime,
                            style: CustomTheme.textStyles.mainTextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 63.0,
                    child: _isOpened
                        ? Text(
                            lng.homePage.endText,
                            style: CustomTheme.textStyles.accentTextStyle(
                              size: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : SizedBox(),
                  ),
                  Expanded(
                    child: Text(
                      widget.order?.endAddress ?? '',
                      style: CustomTheme.textStyles.mainTextStyle(),
                    ),
                  ),
                  InkWell(
                    onTap: () async => openMapWithAddress(widget.order.endAddress),
                    child: Icon(
                      Icons.navigation,
                      color: CustomTheme.colors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  InkWell(
                    onTap: () => widget.openPhoneDialog(widget.order?.endPhone),
                    child: Icon(
                      Icons.phone,
                      color: CustomTheme.colors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(
                    Icons.query_builder,
                    color: CustomTheme.colors.font,
                  ),
                  const SizedBox(width: 4.0),
                  SizedBox(
                    width: 50.0,
                    child: Text(
                      widget.order.endTime,
                      style: CustomTheme.textStyles.mainTextStyle(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              if (widget.status == OrdersMenuState.opened && _isOpened)
                Expanded(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.order?.coast ?? '',
                            style: CustomTheme.textStyles.accentTextStyle(
                              size: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          AppButton(
                            onTap: () => widget.startOrder(widget.order),
                            radius: 10.0,
                            width: 100.0,
                            child: Text(
                              lng.homePage.startOrder,
                              style: CustomTheme.textStyles.buttonTextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (widget.status == OrdersMenuState.inProgress && _isOpened)
                Expanded(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.order?.coast ?? '',
                            style: CustomTheme.textStyles.accentTextStyle(
                              size: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          AppButton(
                            onTap: () => widget.closeOrder(widget.order),
                            radius: 10.0,
                            width: 100.0,
                            child: Text(
                              lng.homePage.closeOrder,
                              style: CustomTheme.textStyles.buttonTextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusWidget() {
    return Container(
      alignment: Alignment.center,
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomTheme.colors.minorFont,
          width: 2,
        ),
        shape: BoxShape.circle,
        color: _getColorForStatus(),
      ),
    );
  }

  Color _getColorForStatus() {
    switch (widget.status) {
      case OrdersMenuState.opened:
        return Colors.white;
      case OrdersMenuState.inProgress:
        return Colors.yellow;
      case OrdersMenuState.closed:
        return Colors.greenAccent;
    }

    return Colors.white;
  }
}
