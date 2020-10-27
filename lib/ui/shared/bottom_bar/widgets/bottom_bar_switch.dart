import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/utils/clean_behavior.dart';
import 'package:my_catalog/widgets/list_tile_item.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar_vm.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';

class BottomBarSwitch extends StatefulWidget {
  final String keyValue;
  final bool isSwitch;
  final void Function(String, BottomBarVM) onTap;
  final String Function(String) getPlaceholder;
  final void Function() close;
  final BottomBarVM vm;

  BottomBarSwitch({
    @required this.keyValue,
    @required this.close,
    @required this.vm,
    @required this.isSwitch,
    @required this.onTap,
    @required this.getPlaceholder,
  }) : super(key: Key(keyValue));

  @override
  _BottomBarSwitchState createState() => _BottomBarSwitchState();
}

class _BottomBarSwitchState extends State<BottomBarSwitch> {
  final double _initialHeight = 190;
  double _height ;

  @override
  Widget build(BuildContext context) {
    if (!widget.isSwitch) {
      _height = _initialHeight;
    }
    List<FooterButtonModel> switchItems;
    switchItems = widget.vm.footerButtons.where((element) => element.type == PageTypes.SWITCH_TYPE).toList().first.list;
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails detail) => _verticalDrag(detail),
      child: AnimatedContainer(
        duration: MILLISECONDS_300,
        height: widget.isSwitch ? _height : 0.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlack.withOpacity(0.3),
              blurRadius: 1.5,
            ),
          ],
          color: AppColors.kWhite,
        ),
        alignment: Alignment.topCenter,
        child: AnimatedOpacity(
          duration: MILLISECONDS_300,
          curve: Curves.easeInOutCirc,
          opacity: widget.isSwitch ? 1.0 : 0.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(ImageAssets.HANDLE),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: CleanBehavior(),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTileItem(
                        keyValue: '${BottomBarKeys.bottomBarSwitchItem}$index',
                        title: switchItems[index].name[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()],
                        iconPath: switchItems[index].iconSvg,
                        placeholderIcon: widget.getPlaceholder(switchItems[index].type),
                        onTap: () => widget.onTap(switchItems[index].type, widget.vm),
                      );
                    },
                    itemCount: switchItems.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verticalDrag(DragUpdateDetails detail) {
    if (detail.localPosition.dy < 0.0) {
      return;
    }
    if (_height < _initialHeight / 4.0) {
      widget.close();
      _height = _initialHeight;
      setState(() {});
      return;
    }
    setState(
      () {
        _height = _initialHeight - detail.localPosition.dy;
      },
    );
  }
}
