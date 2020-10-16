import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page_vm.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/file_view_button.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

import 'widgets/image_viewer.dart';
import 'widgets/single_product_list_item.dart';

class SingleProductPage extends StatelessWidget {
  SingleProductPage() : super(key: Key('SingleProductPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SingleProductPageVM>(
      converter: SingleProductPageVM.fromStore,
      builder: (BuildContext context, SingleProductPageVM vm) {
        return MainLayout(
          bgColor: AppColors.kWhite,
          appBar: MainAppBar(key: SingleProductKeys.appbar),
          bottomBar: BottomBar(key: SingleProductKeys.bottomBar),
          child: CleanedListView(
            keyValue: SingleProductKeys.listView,
            children: [
              const SizedBox(height: 20.0),
              Text(
                vm.product.languages[vm.currentLocale][KEY_TITLE],
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.accentTextStyle(size: 22, fontWeight: FontWeight.w600),
              ),
              ImageViewer(
                key: SingleProductKeys.gallery,
                gallery: vm.product.galleryImagesLinks,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Description',
                  style: CustomTheme.textStyles.titleTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  vm.product.languages[vm.currentLocale][KEY_DESCRIPTION],
                  style: CustomTheme.textStyles.mainTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              for (String point in vm.product.languages[vm.currentLocale][KEY_POINTS])
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SingleProductListItem(
                    title: point,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  vm.product.languages[vm.currentLocale][KEY_DESCRIPTION_2],
                  style: CustomTheme.textStyles.mainTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: vm.files.length * 80.0,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: vm.files.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FileViewButton(
                      keyValue: SingleProductKeys.fileItem + index.toString(),
                      file: vm.files[index],
                      locale: vm.currentLocale,
                      onTap: () => vm.filePreview(vm.files[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
