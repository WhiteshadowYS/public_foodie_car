import 'package:flutter/material.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/domain/functional_services/route_service/route_service.dart';

class AppTopBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final int buscketCount;
  final void Function() pop;
  final void Function() openBusket;
  final void Function() openLocationInfo;

  const AppTopBar({
    @required this.title,
    this.pop,
    this.openBusket,
    this.openLocationInfo,
    this.buscketCount,
  }) : super(key: const Key('AppTopBar'));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: CustomTheme.colors.primaryColor,
      title: Text(
        title,
        style: CustomTheme.textStyles.titleTextStyle(),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0.0, 60.0);
}
