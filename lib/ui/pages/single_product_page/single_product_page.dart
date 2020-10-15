import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                'Product title',
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.accentTextStyle(size: 22.sp, fontWeight: FontWeight.w600),
              ),
              ImageViewer(
                key: SingleProductKeys.gallery,
                gallery: [
                  'https://24smi.org/public/media/resize/800x-/2018/1/25/ruu3af4b8cb17.jpg',
                  'https://img.pravda.com/images/doc/4/3/4377786-original.jpg',
                  'https://img.tsn.ua/cached/1570658675/tsn-c458e64851561f73ec5a071df604b604/thumbs/1340x530/40/d0/bd0482e31e2156cd627fbf6cbf5fd040.png',
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Description',
                  style: CustomTheme.textStyles.titleTextStyle(size: 15.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: CustomTheme.textStyles.mainTextStyle(size: 15.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              for (String point in ['Point', 'Point', 'Point', 'Point', 'Point', 'Point'])
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SingleProductListItem(
                    title: point,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: CustomTheme.textStyles.mainTextStyle(size: 15.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: dummyFiles.length * 80.0,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dummyFiles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FileViewButton(
                      keyValue: SingleProductKeys.fileItem,
                      dummyFile: dummyFiles[index],
                      onTap: () => vm.filePreview(dummyFiles[index]),
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
