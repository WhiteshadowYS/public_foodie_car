import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page_vm.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/file_view_button.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/image_viewer.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/single_product_list_item.dart';
import 'package:my_catalog/utils/clean_behavior.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

class SingleProductPageWidget extends StatelessWidget {
  SingleProductPageWidget() : super(key: Key(SingleProductKeys.mainWidget));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SingleProductPageVM>(
      converter: SingleProductPageVM.fromStore,
      builder: (BuildContext context, SingleProductPageVM vm) {
        return CleanedListView(
          keyValue: SingleProductKeys.listView,
          children: [
            const SizedBox(height: 20.0),
            Text(
              vm.product.titleForLanguage(vm.currentLocale),
              textAlign: TextAlign.center,
              style: CustomTheme.textStyles.accentTextStyle(size: 24.h, fontWeight: FontWeight.w600),
            ),
          SizedBox(height: 16.0),
            ImageViewer(
              showGallery: vm.showImage,
              keyValue: SingleProductKeys.gallery,
              cachedImagesGalery: buildCachedImagesList(vm.product.galleryImagesLinks),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Text(
                vm.descriptionText(
                  vm.currentLocale,
                ),
                style: CustomTheme.textStyles.titleTextStyle(size: 16.h),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                vm.product.descriptionForLanguage(vm.currentLocale),
                style: CustomTheme.textStyles.mainTextStyle(size: 16.h),
                textAlign: TextAlign.center,
              ),
            ),
            for (String point in vm.product.pointsForLanguage(vm.currentLocale))
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                child: SingleProductListItem(
                  keyValue: 'SingleProductListItem${vm.product.pointsForLanguage(vm.currentLocale).indexOf(point)}',
                  title: point,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.0),
              child: Text(
                vm.product.description2ForLanguage(vm.currentLocale),
                style: CustomTheme.textStyles.mainTextStyle(size: 15.h),
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
        );
      },
    );
  }

  List<Widget> buildCachedImagesList(List<String> images) {
    List<Widget> cachedImagesList = [];
    for (String image in images) {
      cachedImagesList.add(
        CachedImage(
          key: Key(SingleProductKeys.gallery + 'CachedImage'),
          imageUrl: image ?? '',
          fit: BoxFit.contain,
        ),
      );
    }

    return cachedImagesList;
  }
}
