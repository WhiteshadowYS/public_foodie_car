import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/const.dart';

import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';
import 'package:my_catalog/widgets/links_button.dart';
import 'package:my_catalog/widgets/main_button.dart';

import 'widgets/catalog_id_search.dart';
import 'widgets/catalog_list.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _error = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MainPageDictionary dictionary = FlutterDictionary.instance.language.mainPageDictionary;
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, MainPageVM vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                CatalogList(
                  key: 'MainPageCatalogList',
                  vm: vm,
                  setId: (int id) {
                    controller.text = id.toString();
                  },
                ),
                SizedBox(height: 50.h),
                Text(
                  dictionary.enterCatalogId,
                  style: CustomTheme.textStyles.titleTextStyle(size: 18),
                ),
                CatalogIdSearchTextField(
                  key: 'MainPageIdTextField',
                  controller: controller,
                  onSubmitted: (String value) => _onSubmitted(value, vm),
                  onChanged: (String value) => _onChanged(value, vm),
                  error: _error,
                ),
                MainButton(
                  key: 'MainPageSearchButton',
                  title: dictionary.viewCatalog,
                  onTap: () => _onSubmitted(vm.catalogId, vm),
                ),
                const SizedBox(height: 24.0),
                LinksButton(
                  key: 'MainPageOwnCatalogButton',
                  title: dictionary.iWantToCreate,
                  // TODO(Andrey): Add url;
                  url: WANNA_CREATE_MY_CATALOG_LINK,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onChanged(String value, MainPageVM mainPageVM) {
    if (_error == true) {
      _error = false;
      setState(() {});
      return;
    }
    mainPageVM.saveCatalogId(value);
  }

  void _onSubmitted(String value, MainPageVM mainPageVM) {
    // TODO(Andrey): Add validation;
    print(value);
    if (value == '') {
      _error = true;
      setState(() {});
      return;
    }

    mainPageVM.navigateToTermsPage();
  }
}
