import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:my_catalog/res/app_styles/app_shadows.dart';

import 'package:my_catalog/handler/route_handler.dart';

import 'package:my_catalog/models/models/bottom_bar_item_model.dart';

import 'package:my_catalog/theme/custom_theme.dart';

import 'package:my_catalog/ui/layouts/bottom_bar/bottom_bar_view_model.dart';
import 'package:my_catalog/ui/layouts/bottom_bar/widgets/bottom_bar_item.dart';

class BottomBar extends StatelessWidget {
  static final GlobalKey bottomBarKey = GlobalKey(debugLabel: 'Bottom Bar');
  static const Radius _kBorderRadius = Radius.circular(25.0);
  final double height;

  BottomBar({
    this.height = 90.0,
  }) : super(key: Key('lalal'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: BottomBarViewModel.fromStore,
      builder: (BuildContext context, BottomBarViewModel viewModel) {
        return  Container(
          key: bottomBarKey,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          decoration: BoxDecoration(
            color: CustomTheme.colors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: _kBorderRadius,
              topRight: _kBorderRadius,
            ),
            boxShadow: AppShadows.bottomBarShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: RouteHandler.instance.barItems.map((BottomBarItemModel bottomBarItemModel) {
              return BottomBarItem(
                onTap: () => viewModel.navigateTo(bottomBarItemModel.route),
                iconData: bottomBarItemModel.iconData,
                isSelected: bottomBarItemModel.isSelected,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}