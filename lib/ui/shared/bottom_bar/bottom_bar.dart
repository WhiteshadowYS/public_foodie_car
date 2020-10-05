import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar_vm.dart';
import 'package:my_catalog/ui/shared/bottom_bar/widgets/bottom_bar_item.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class BottomBar extends StatefulWidget {
  final double height;

  BottomBar({
    @required String key,
    this.height = 100.0,
  }) : super(key: Key(key));

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool isSwitch = false;

  // TODO(Daniil): Need to refactor
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomBarVM>(
      converter: BottomBarVM.fromStore,
      builder: (BuildContext context, vm) {
        List<FooterButtonModel> switchItems =
            vm.footerButtons.where((element) => element.type == PageTypes.SWITCH_TYPE).toList().first.list;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: MILLISECONDS_300,
              height: isSwitch ? 180 : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kBlack.withOpacity(0.3),
                    blurRadius: 1.5,
                  )
                ],
                color: AppColors.kWhite,
              ),
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedOpacity(
                  duration: MILLISECONDS_300,
                  opacity: isSwitch ? 1 : 0,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: SvgPicture.network(
                          switchItems[index].iconSvg,
                          height: 20.0,
                          color: AppColors.kGreen,
                        ),
                        title: Text(switchItems[index].type),
                        trailing: Transform.rotate(
                          angle: 3.14,
                          child: SVGImages().backArrow(),
                        ),
                        onTap: () {},
                      );
                    },
                    itemCount: switchItems.length,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.kWhite),
                color: AppColors.kWhite,
              ),
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var item in vm.footerButtons)
                    BottomBarItem(
                      iconUrl: item.iconSvg,
                      onTap: () => _onTap(item.type, vm),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _onTap(String type, BottomBarVM vm) {
    switch (type) {
      case PageTypes.HOME_TYPE:
        vm.navigateCategoriesPage();
        break;
      case PageTypes.SETTINGS_TYPE:
        vm.navigateToSettingsPage();
        break;
      case PageTypes.LOGOUT_TYPE:
        vm.navigateToMainPage();
        break;
      case PageTypes.SWITCH_TYPE:
        setState(() {
          isSwitch = !isSwitch;
        });
        break;
    }
  }
}
