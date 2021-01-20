import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/models/routes.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/app_bar/app_top_bar.dart';
import 'package:foodie_client_template/ui/layouts/bottom_bar/app_bottom_bar.dart';
import 'package:foodie_client_template/ui/layouts/bottom_bar/widgets/app_bottom_bar_item.dart';
import 'package:foodie_client_template/ui/layouts/focus_layout/focus_layout.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout_vm.dart';

class MainLayout extends StatefulWidget {
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
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainLayoutVM>(
      converter: MainLayoutVM.init,
      builder: (BuildContext context, MainLayoutVM vm) {
        return Scaffold(
          appBar: widget.showAppBar
              ? AppTopBar(
                  pop: vm.pop,
                  openBusket: vm.gotoBusketPage,
                  openLocationInfo: vm.gotoAboutPage,
                  title: vm.title,
                )
              : null,
          bottomNavigationBar: widget.showBottomBar
              ? AppBottomBar(
                  key: Key('[BottomBar]'),
                  gotoPage: vm.gotoPage,
                  selectedPage: vm.selectedPage,
                  items: [
                    AppBottomBarItem(
                      key: Key('${Routes.profile_page}[BottomBarButton]'),
                      page: Routes.profile_page,
                      icon: Icons.person,
                    ),
                    AppBottomBarItem(
                      key: Key('${Routes.home_page}[BottomBarButton]'),
                      page: Routes.home_page,
                      icon: Icons.home,
                    ),
                    AppBottomBarItem(
                      key: Key('${Routes.gallery_page}[BottomBarButton]'),
                      page: Routes.gallery_page,
                      icon: Icons.image,
                    ),
                  ],
                )
              : null,
          backgroundColor: Colors.white,
          body: Directionality(
            textDirection: vm.textDirection,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  ...vm.loaders.map<Widget>((e) {
                    return e.widget;
                  }).toList(),
                  FocusLayout(
                    key: Key(widget.child.runtimeType.toString() + '[MainLayout]' + '[FocusLayout]'),
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
