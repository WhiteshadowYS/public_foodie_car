import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/product_page/product_page_vm.dart';
import 'package:foodie_client_template/ui/widgets/app_button.dart';
import 'package:foodie_client_template/ui/widgets/image_container.dart';

class ProductPage extends StatelessWidget {
  ProductPage() : super(key: const Key('[ProductPage][Key]'));
  final lng = FlutterDictionary.instance.language;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductPageVM>(
      converter: ProductPageVM.init,
      builder: (BuildContext context, ProductPageVM vm) {
        return MainLayout(
          key: Key('[ProductPage][MainLayout][Key]'),
          child: ListView(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child: SizedBox(
                      height: 240.sp,
                      width: double.infinity,
                      child: ImageContainer(
                        key: Key(key.toString() + '[ImageContainer][Key]'),
                        imageUrl: vm.product?.baseImage?.originalImageUrl ?? '',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 200.sp),
                      Container(
                        height: 40.sp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomTheme.colors.accentColor.withOpacity(0.24),
                              blurRadius: 4.0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Text(
                          vm.product?.title ?? lng.global.noNameText,
                          style: CustomTheme.textStyles.accentTextStyle(
                            size: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lng.global.descriptionTitle,
                      style: CustomTheme.textStyles.accentTextStyle(
                        fontWeight: FontWeight.w500,
                        color: CustomTheme.colors.font,
                      ),
                    ),
                    Container(
                      height: 1.sp,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      width: double.infinity,
                      color: CustomTheme.colors.primaryColor,
                    ),
                    Text(
                      vm.product?.description ?? '',
                      style: CustomTheme.textStyles.accentTextStyle(
                        size: 16.0,
                        color: CustomTheme.colors.font,
                      ),
                    ),
                    SizedBox(height: 40.sp),
                    Text(
                      lng.global.weightTitle + (vm.product?.weight?.toString() ?? '') + lng.global.weightValue,
                      style: CustomTheme.textStyles.accentTextStyle(
                        fontWeight: FontWeight.w500,
                        color: CustomTheme.colors.font,
                      ),
                    ),
                    Container(
                      height: 1.sp,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      width: double.infinity,
                      color: CustomTheme.colors.primaryColor,
                    ),
                    SizedBox(height: 24.sp),
                    Text(
                      lng.global.currecyTitle + (vm.product?.price?.toString() ?? '') + lng.global.currencyValue,
                      style: CustomTheme.textStyles.accentTextStyle(
                        fontWeight: FontWeight.w500,
                        color: CustomTheme.colors.font,
                      ),
                    ),
                    Container(
                      height: 1.sp,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      width: double.infinity,
                      color: CustomTheme.colors.primaryColor,
                    ),
                    SizedBox(height: 40.sp),
                    Row(
                      children: [
                        AppButton(
                          key: Key('[ProductPage][Button][Key]'),
                          width: 140.sp,
                          radius: 20.sp,
                          onTap: () {
                            vm.addToBusket(vm.product);
                            vm.pop();
                          },
                          child: Text(
                            lng.global.buyButtonText,
                            style: CustomTheme.textStyles.buttonTextStyle(
                              size: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
