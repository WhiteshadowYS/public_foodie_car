import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_bar_item.dart';

class BottomBarList extends StatefulWidget {
  final String keyValue;
  final BottomBarVM vm;
  final void Function(String, BottomBarVM) onTap;
  final String Function(String) getPlaceholder;
  final bool isSwitch;
  final double height;

   BottomBarList({
    @required this.keyValue,
    @required this.height,
    @required this.vm,
    @required this.isSwitch,
    @required this.onTap,
    @required this.getPlaceholder,
  }) : super(key: Key(keyValue));

  @override
  _BottomBarListState createState() => _BottomBarListState();
}

class _BottomBarListState extends State<BottomBarList> {
  int selectedIndex = 0;

  @override
  void initState() {
    _updateSelectedIndex(widget.vm.footerButtons);
    super.initState();
  }

  @override
  void didUpdateWidget(BottomBarList oldWidget) {
    _updateSelectedIndex(widget.vm.footerButtons);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomTheme.colors.footerBackground),
        color: CustomTheme.colors.footerBackground,
      ),
      height: widget.height,
      child: Row(
          mainAxisAlignment: ScreenUtil.screenWidth < 600 ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
          children: widget.vm.footerButtons.map((item) {
            return BottomBarItem(
              key: BottomBarKeys.footerButtonKey + '${widget.vm.footerButtons.indexOf(item)}',
              iconUrl: item.iconSvg,
              placeholderIcon: widget.getPlaceholder(item.type),
              onTap: () => widget.onTap(item.type, widget.vm),
              isSelected: selectedIndex == widget.vm.footerButtons.indexOf(item),
            );
          }).toList()),
    );
  }

  void _updateSelectedIndex(List<FooterButtonModel> buttons) {
    selectedIndex = -1;
    if (RouteService.instance.currentRoute == Routes.categories) {
      selectedIndex = buttons.indexWhere((element) => element.type == PageTypes.HOME_TYPE);
    } else if (RouteService.instance.currentRoute == Routes.settings) {
      selectedIndex = buttons.indexWhere((element) => element.type == PageTypes.SETTINGS_TYPE);
    } else if (RouteService.instance.currentRoute == Routes.main) {
      selectedIndex = buttons.indexWhere((element) => element.type == PageTypes.SIGNOUT_TYPE);
    } else if (widget.isSwitch) {
      selectedIndex = buttons.indexWhere((element) => element.type == PageTypes.SWITCH_TYPE);
    } else {
      selectedIndex = -1;
    }

    setState(() {});
  }
}
