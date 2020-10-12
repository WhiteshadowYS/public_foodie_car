import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/focus_service/focus_service.dart';
import 'package:my_catalog/services/validation_service/validation_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';
import 'package:my_catalog/utils/clean_behavior.dart';
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
  final FocusService _focusService = FocusService();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusService.addKey(
      FocusKey(
        order: 1,
        value: 'MainPageIdTextField',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MainPageDictionary dictionary = FlutterDictionary.instance.language.mainPageDictionary;
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, MainPageVM vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          child: CleanedListView(
            children: [
              const SizedBox(height: 24.0),
              StoresList(
                key: 'MainPageCatalogList',
                stores: vm.catalogs,
                setId: (int id) => setState(() {
                  _controller.text = id.toString();
                }),
              ),
              const SizedBox(height: 48.0),
              Center(
                child: Text(
                  dictionary.enterCatalogId,
                  style: CustomTheme.textStyles.titleTextStyle(size: 18),
                ),
              ),
              const SizedBox(height: 8.0),
              CatalogIdSearchTextField(
                focusKeyValue: 'MainPageIdTextField',
                focusService: _focusService,
                controller: _controller,
                validator: (arg) => ValidationService.numberValidation(
                  arg,
                  FlutterDictionary.instance.language.errorDictionary,
                ),
              ),
              const SizedBox(height: 20.0),
              MainButton(
                key: 'MainPageSearchButton',
                title: dictionary.viewCatalog,
                onTap: () => _onButtonPressed(vm),
                controller: _controller,
                validator: (arg) => ValidationService.numberValidation(
                  arg,
                  FlutterDictionary.instance.language.errorDictionary,
                ),
              ),
              const SizedBox(height: 64.0),
              LinksButton(
                key: 'MainPageOwnCatalogButton',
                title: dictionary.iWantToCreate,
                url: WANNA_CREATE_MY_CATALOG_LINK,
              ),
            ],
          ),
        );
      },
    );
  }

  void _onButtonPressed(MainPageVM vm) => vm.checkId(_controller.text);
}
