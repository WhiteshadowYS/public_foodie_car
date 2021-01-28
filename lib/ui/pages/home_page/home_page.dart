import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_car_template/data/res/const.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/orders_state/orders_state.dart';
import 'package:foodie_car_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_car_template/ui/pages/home_page/home_page_vm.dart';
import 'package:foodie_car_template/ui/pages/home_page/widgets/order_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final lng = FlutterDictionary.instance.language;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: StoreConnector<AppState, HomePageVM>(
        converter: HomePageVM.init,
        builder: (BuildContext context, HomePageVM vm) {
          return MainLayout(
            key: Key('[HomePage]'),
            child: _buildContent(vm),
          );
        },
      ),
    );
  }

  Widget _buildContent(HomePageVM vm) {
    return Column(
      children: [
        _buildNavigationBar(vm),
        _buildOrdersList(vm),
      ],
    );
  }

  Widget _buildOrdersList(HomePageVM vm) {
    final List<Order> orders = _filterOrder(vm.orders, vm);

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        itemCount: orders?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return OrderItem(
            status: vm.menuState,
            order: orders[index],
            startOrder: vm.startOrder,
            closeOrder: vm.closeOrder,
            openMapDialog: vm.openMapDialog,
            openPhoneDialog: vm.openPhoneDialog,
          );
        },
      ),
    );
  }

  List<Order> _filterOrder(List<Order> orders, HomePageVM vm) {
    return orders.where((order) {
      if (vm.menuState == OrdersMenuState.opened && order.status == ORDER_STATUS_OPENED) {
        return true;
      }
      if (vm.menuState == OrdersMenuState.closed && order.status == ORDER_STATUS_CLOSED) {
        return true;
      }
      if (vm.menuState == OrdersMenuState.inProgress && order.status == ORDER_STATUS_ACTIVE) {
        return true;
      }

      return false;
    }).toList();
  }

  Widget _buildNavigationBar(HomePageVM vm) {
    return Row(
      children: [
        _buildPageButton(
          title: lng.homePage.createdOrdersTitle,
          isActive: vm.menuState == OrdersMenuState.opened,
          onTap: () => vm.changeMenuState(OrdersMenuState.opened),
        ),
        _buildPageButton(
          title: lng.homePage.activeOrdersTitle,
          isActive: vm.menuState == OrdersMenuState.inProgress,
          onTap: () => vm.changeMenuState(OrdersMenuState.inProgress),
        ),
        _buildPageButton(
          title: lng.homePage.closedOrdersTitle,
          isActive: vm.menuState == OrdersMenuState.closed,
          onTap: () => vm.changeMenuState(OrdersMenuState.closed),
        ),
      ],
    );
  }

  Widget _buildPageButton({
    bool isActive = false,
    String title = '',
    void Function() onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 60.0,
              alignment: Alignment.center,
              child: Text(
                title,
                style: CustomTheme.textStyles.accentTextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomTheme.colors.font,
                  size: 16.0,
                ),
              ),
            ),
            Container(
              color: isActive ? CustomTheme.colors.primaryColor : Colors.transparent,
              height: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
