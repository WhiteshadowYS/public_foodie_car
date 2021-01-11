import 'package:flutter/material.dart';
import 'package:foodie_client_template/data/res/settings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/ui/layouts/bottom_bar/widgets/bottom_bar_item.dart';

class AppBottomBar extends StatelessWidget {
  final String selectedPage;
  final List<AppBottomBaritem> items;
  final void Function(String) gotoPage;

  const AppBottomBar({
    @required Key key,
    @required this.items,
    @required this.selectedPage,
    @required this.gotoPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.colors.primaryColor,
      height: AppSettings.bottomBarHeight.sp,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.map<Widget>((item) {
            if (item.page != null && selectedPage == item.page) {
              return InkWell(
                onTap: () => gotoPage(item.page),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomTheme.colors.accentColor,
                  ),
                  child: item,
                ),
              );
            }

            return InkWell(
              onTap: () => gotoPage(item.page),
              child: item,
            );
          }).toList(),
        ),
      ),
    );
  }
}
