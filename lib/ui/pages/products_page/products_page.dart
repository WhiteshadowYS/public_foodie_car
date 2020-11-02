import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/products_page/products_page_vm.dart';
import 'package:my_catalog/ui/pages/products_page/widgets/product_item.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page_vm.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/file_view_button.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/image_viewer.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/single_product_list_item.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/utils/clean_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage() : super(key: Key('ProductsPage'));
  bool isLargeScreen = false;
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }
    return StoreConnector<AppState, ProductsPageVM>(
      converter: ProductsPageVM.fromStore,
      builder: (BuildContext context, ProductsPageVM vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          appBar: MainAppBar(
            key: ProductsPageKeys.appbar,
            backButtonText: vm.backButtonText(
              vm.currentLocale,
            ),
            title: vm.productsPageTitle(
              vm.currentLocale,
            ),
          ),
          bottomBar: BottomBar(key: ProductsPageKeys.bottomBar),
          child: Container(margin: EdgeInsets.only(
            top: 0.sp,
          ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width /2.5,
                  child: ScrollConfiguration(
                    behavior: CleanBehavior(),
                    child: ListView.builder(
                      key: Key(ProductsPageKeys.listView),
                      physics: ClampingScrollPhysics(),
                      itemCount: vm.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ProductModel product = vm.getCurrentProductData(vm.products[index].id);

                        if (product == null) return Container();

                        return ProductItem(
                          keyValue: ProductsPageKeys.productItem,
                          product: product,
                          textDirection: vm.textDirection,
                          locale: vm.currentLocale,
                          onTap: () => vm.navigateToSingleProductPagePage(product.id),
                        );
                      },
                    ),
                  ),
                ),
                Container(height: double.infinity, width: 2.5, color:  Colors.blue,),
                isLargeScreen ? Container(
                  width:  (MediaQuery.of(context).size.width -2.5) / 1.7,
                  child: StoreConnector<AppState, SingleProductPageVM>(
                      converter: SingleProductPageVM.fromStore,
                      builder: (BuildContext context, SingleProductPageVM vm) {
                      return CleanedListView(
                        keyValue: SingleProductKeys.listView,
                        children: [
                          const SizedBox(height: 20.0),
                          Text(
                            vm.product.titleForLanguage(vm.currentLocale),
                            textAlign: TextAlign.center,
                            style: CustomTheme.textStyles.accentTextStyle(size: 22.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 16.sp),
                          ImageViewer(
                            showGallery: vm.showImage,
                            keyValue: SingleProductKeys.gallery,
                            cachedImagesGalery: buildCachedImagesList(vm.product.galleryImagesLinks),
                          ),
                          SizedBox(height: 16.sp),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.0),
                            child: Text(
                              vm.descriptionText(
                                vm.currentLocale,
                              ),
                              style: CustomTheme.textStyles.titleTextStyle(size: 15.sp),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              vm.product.descriptionForLanguage(vm.currentLocale),
                              style: CustomTheme.textStyles.mainTextStyle(size: 15.h),
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
                    }
                  ),
                ) : Container(),
              ],
            ),
          ),
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
