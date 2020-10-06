import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar_vm.dart';
import 'package:my_catalog/ui/shared/bottom_bar/widgets/bottom_bar_switch_item.dart';

class BottomBarSwitch extends StatelessWidget {
  final bool isSwitch;
  final void Function(String, BottomBarVM) onTap;
  final BottomBarVM vm;

  BottomBarSwitch({
    @required this.vm,
    @required this.isSwitch,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<FooterButtonModel> switchItems;
    switchItems = vm.footerButtons.where((element) => element.type == PageTypes.SWITCH_TYPE).toList().first.list;
    // TODO(Daniil): Add focus node;
    return AnimatedContainer(
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
          duration:MILLISECONDS_900,
          curve: Curves.easeInOutCirc,
          opacity: isSwitch ? 1.0 : 0.0,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return BottomBarSwitchItem(
                footerButton: switchItems[index],
                onTap: () => onTap(switchItems[index].type, vm),
              );
            },
            itemCount: switchItems.length,
          ),
        ),
      ),
    );
  }
}
