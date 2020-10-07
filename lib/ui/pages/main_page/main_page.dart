import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';

import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';
import 'package:my_catalog/widgets/links_button.dart';
import 'package:my_catalog/widgets/main_button.dart';
import 'file:///C:/Users/AppVesto/IdeaProjects/my_catalog/lib/ui/pages/main_page/widgets/catalog_text_field.dart';

import 'widgets/catalog_id_search.dart';
import 'widgets/catalog_list.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    final MainPageDictionary dictionary = FlutterDictionary.instance.language.mainPageDictionary;
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, MainPageVM vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                CatalogList(vm: vm),
                SizedBox(height: 50.h),
                Text(dictionary.enterCatalogId, style: CustomTheme.textStyles.titleTextStyle()),
                // TODO(Andrey): Add textField;
                CatalogIdSearchTextField(
                  onSubmitted: (String value) => _onSubmitted(value, vm),
                  onChanged: (String value) => _onChanged(value, vm),
                  error: _error,
                ),
                MainButton(
                  title: dictionary.viewCatalog,
                  onTap: () => _onSubmitted(vm.catalogId, vm),
                  key: 'MainPageButton',
                ),
                const SizedBox(height: 24.0),
                LinksButton(
                  key: 'LinksMainPageButton',
                  title: dictionary.iWantToCreate,
                  // TODO(Andrey): Add url;
                  url:
                      'https://www.google.com/search?q=котята&client=opera&hs=MBB&sxsrf=ALeKk007nQvMQdXtdu4N3La8YFKLRj-hyw:1601990957635&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjy0dmviaDsAhXUAhAIHX9JCGMQ_AUoAXoECBQQAw&biw=1880&bih=939',
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
