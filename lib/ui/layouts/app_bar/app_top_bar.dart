import 'package:flutter/material.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/route_service.dart';

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
        SizedBox(
          height: 48.0,
          width: 48.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: openBusket,
                icon: Icon(
                  Icons.shopping_basket,
                ),
              ),
              buscketCount != null && buscketCount != 0
                  ? Positioned(
                      top: 16.0,
                      left: 4.0,
                      child: Container(
                        alignment: Alignment.center,
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Text(
                          buscketCount.toString(),
                          textAlign: TextAlign.center,
                          style: CustomTheme.textStyles.accentTextStyle(
                            size: 10.0,
                            fontWeight: FontWeight.bold,
                            color: CustomTheme.colors.background,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
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