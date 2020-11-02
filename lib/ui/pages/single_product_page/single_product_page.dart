import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page_vm.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/single_product_page_widget.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
class SingleProductPage extends StatelessWidget {
  SingleProductPage() : super(key: Key('SingleProductPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SingleProductPageVM>(
      converter: SingleProductPageVM.fromStore,
      builder: (BuildContext context, SingleProductPageVM vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          appBar: MainAppBar(
            backButtonText: vm.backButtonText(vm.currentLocale),
            logoUrl: vm.logoUrl,
            key: SingleProductKeys.appbar,
            height: 50.sp,
          ),
          bottomBar: BottomBar(key: SingleProductKeys.bottomBar),
          child: SingleProductPageWidget(),
        );
      },
    );
  }
}
