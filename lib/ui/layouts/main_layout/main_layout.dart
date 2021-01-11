import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/models/routes.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/bottom_bar/bottom_bar.dart';
import 'package:foodie_client_template/ui/layouts/bottom_bar/widgets/bottom_bar_item.dart';
import 'package:foodie_client_template/ui/layouts/focus_layout/focus_layout.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout_vm.dart';

class MainLayout extends StatelessWidget {
  final bool showAppBar;
  final bool showBottomBar;
  final Widget child;

  const MainLayout({
    @required Key key,
    @required this.child,
    this.showAppBar = true,
    this.showBottomBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainLayoutVM>(
      converter: MainLayoutVM.init,
      builder: (BuildContext context, MainLayoutVM vm) {
        return Scaffold(
          appBar: showAppBar
              ? AppBar(
                  backgroundColor: CustomTheme.colors.primaryColor,
                  title: Text(
                    vm.title,
                    style: CustomTheme.textStyles.titleTextStyle(),
                  ),
                )
              : null,
          bottomNavigationBar: showBottomBar
              ? AppBottomBar(
                  key: Key('[BottomBar]'),
                  selectedPage: vm.selectedPage,
                  gotoPage: vm.gotoPage,
                  items: [
                    AppBottomBaritem(
                      key: Key('${Routes.home_page}[BottomBarButton]'),
                      page: Routes.home_page,
                      icon: Icons.home,
                    ),
                    AppBottomBaritem(
                      key: Key('${Routes.gallery_page}[BottomBarButton]'),
                      page: Routes.gallery_page,
                      icon: Icons.image,
                    ),
                    AppBottomBaritem(
                      key: Key('${Routes.about_page}[BottomBarButton]'),
                      page: Routes.about_page,
                      icon: Icons.info,
                    ),
                  ],
                )
              : null,
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FocusLayout(
              key: Key(child.runtimeType.toString() + '[MainLayout]' + '[FocusLayout]'),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
