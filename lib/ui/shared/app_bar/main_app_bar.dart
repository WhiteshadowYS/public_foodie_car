import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar_vm.dart';

import 'widgets/main_app_bar_child.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({
    @required String key,
    this.height = 44.0,
    this.title,
    this.logoUrl,
    this.backOnTap,
    this.backButtonText,
  })  : preferredSize = Size.fromHeight(height.sp),
        super(key: Key(key));

  @override
  final Size preferredSize;
  final String title;
  final String logoUrl;
  final String backButtonText;
  final Function backOnTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        width: double.infinity,
        color: CustomTheme.colors.background,
        alignment: Alignment.center,
        child: StoreConnector<AppState, MainAppbarVM>(
          converter: MainAppbarVM.fromStore,
          builder: (BuildContext context, MainAppbarVM vm) {
            return MainAppBarChild(
              key: key.toString(),
              title: title,
              logoUrl: logoUrl,
              backButtonText: backButtonText,
              textDirection: vm.textDirection,
              backOnTap: backOnTap != null || RouteService.instance.canPop
                  ? () {
                      if (backOnTap != null) {
                        backOnTap();
                      } else {
                        vm.doRoute(RouteService.instance.pop());
                      }
                    }
                  : null,
            );
          },
        ),
      ),
    );
  }
}
