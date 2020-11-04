import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/products_page/products_page_vm.dart';
import 'package:my_catalog/ui/pages/products_page/widgets/product_item.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/single_product_page_widget.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage() : super(key: Key('ProductsPage'));

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with SingleTickerProviderStateMixin {
  bool _isProductSelected = false;
  bool _shouldShowList = true;
  bool isLargeScreen = false;
  AnimationController _sizeController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _sizeController = AnimationController(vsync: this, duration: MILLISECONDS_500, value: 1.0);
    _sizeController.addListener(_animationListener);
    animation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _sizeController.removeListener(_animationListener);
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600.0;
    final double listWidth = isLargeScreen ? (MediaQuery.of(context).size.width - 25.5) / 2.5 : MediaQuery.of(context).size.width;
    return StoreConnector<AppState, ProductsPageVM>(
      converter: ProductsPageVM.fromStore,
      builder: (BuildContext context, ProductsPageVM vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          appBar: MainAppBar(
            key: ProductsPageKeys.appbar,
            backButtonText: vm.backButtonText(vm.currentLocale),
            title: vm.productsPageTitle(vm.currentLocale),
          ),
          bottomBar: BottomBar(key: ProductsPageKeys.bottomBar),
          child: Row(
            children: [
              SizeTransition(
                axisAlignment: -1,
                sizeFactor: animation,
                axis: Axis.horizontal,
                child: SizedBox(
                  width: listWidth,
                  child: ScrollConfiguration(
                    behavior: CleanBehavior(),
                    child: ListView.builder(
                      key: Key(ProductsPageKeys.listView),
                      physics: ClampingScrollPhysics(),
                      itemCount: vm.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ProductModel product = vm.getCurrentProductData(vm.products[index].id);
                        if (product == null) return SizedBox();
                        return ProductItem(
                          keyValue: ProductsPageKeys.productItem,
                          product: product,
                          textDirection: vm.textDirection,
                          locale: vm.currentLocale,
                          onTap: () {
                            if (isLargeScreen) {
                              vm.setOpenedProduct(product.id);
                              _isProductSelected = true;
                            } else {
                              vm.navigateToSingleProductPagePage(product.id);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (isLargeScreen) ...largeScreenProduct(isProductSelected: _isProductSelected),
            ],
          ),
        );
      },
    );
  }

  List<Widget> largeScreenProduct({bool isProductSelected}) {
    return [
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (_shouldShowList) {
              _sizeController.reverse();
            } else {
              _sizeController.forward();
            }
            _shouldShowList = !_shouldShowList;
            setState(() {});
          },
          child: Transform.rotate(
            angle: pi * (1 - animation.value),
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SVGImages().backArrow(),
            ),
          ),
        ),
      ),
      Container(
        height: double.infinity,
        width: 1.5,
        color: Colors.grey.withOpacity(0.4),
      ),
      if (isProductSelected) Expanded(child: SingleProductPageWidget()) else SizedBox(),
    ];
  }

  void _animationListener() {
    setState(() {});
  }
}
