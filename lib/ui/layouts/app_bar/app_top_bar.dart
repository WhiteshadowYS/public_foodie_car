import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/route_service.dart';

class AppTopBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final void Function() pop;
  final void Function() openBusket;
  final void Function() openLocationInfo;

  const AppTopBar({
    @required this.title,
    this.pop,
    this.openBusket,
    this.openLocationInfo,
  }) : super(key: const Key('AppTopBar'));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: CustomTheme.colors.primaryColor,
      leading: !RouteService.instance.canPop
          ? IconButton(
              onPressed: openLocationInfo,
              icon: Icon(Icons.near_me),
            )
          : IconButton(
              onPressed: pop,
              icon: Icon(Icons.arrow_back_ios),
            ),
      actions: [
        IconButton(
          onPressed: openBusket,
          icon: Icon(
            Icons.shopping_basket,
          ),
        ),
        SizedBox(width: 8.0),
      ],
      title: Text(
        title,
        style: CustomTheme.textStyles.titleTextStyle(),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0.0, 60.0);
}
