import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/catalogs_page/catalogs_page_vm.dart';
import 'package:my_catalog/ui/pages/catalogs_page/widgets/catalog_item.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class CatalogsPage extends StatelessWidget {
  CatalogsPage() : super(key: Key('CatalogsPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CatalogsPageVM>(
      onInitialBuild: (CatalogsPageVM vm) {
        if (vm.isLanguagePopupNeeded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            vm.openLanguagePopup();
          });
        }
      },
      converter: CatalogsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          appBar: MainAppBar(
            key: 'CatalogsPageAppbar',
            height: 50.h,
            logoUrl: vm.logoUrl,
            backOnTap: vm.logOut,
            backButtonText: vm.logoutText(vm.currentLocale),
          ),
          bgColor: CustomTheme.colors.background,
          canExit: true,
          back: () => vm.exitDialog(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CleanBehavior(),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        vertical: 24.h,
                      ),
                      itemCount: vm.catalogs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final CatalogModel catalog = vm.getCurrentCatalogData(vm.catalogs[index].id);

                        if (catalog == null) return Container();

                        return CatalogItem(
                          keyValue: CatalogsPageKeys.catalogItem + '$index',
                          locale: vm.currentLocale,
                          catalog: catalog,
                          descriptionTitle: vm.descriptionTitleText(vm.currentLocale),
                          navigateToCategories: vm.navigateToCategoriesPage,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
