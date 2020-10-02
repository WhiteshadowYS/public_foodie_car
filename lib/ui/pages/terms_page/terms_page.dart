import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/dictionary/dictionary_classes/terms_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/terms_page/terms_page_vm.dart';

class TermsPage extends StatelessWidget {
  TermsPage() : super(key: Key('TermsPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TermsPageVM>(
      converter: TermsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        final TermsPageDictionary dictionary = FlutterDictionary.instance.language.termsPageDictionary;
        return MainLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dictionary.title, style: CustomTheme.textStyles.titleTextStyle(size: 18.0),),
              Text('qweqweqweqweqweqwe\nqweqweqweqweqweqwe\nqweqweqweqweqweqwe\nqweqweqweqweqweqwe\nqweqweqweqweqweqwe \n qweqweqweqweqweqwe \nqweqweqweqweqweqwe \n qweqweqweqweqweqwe \n'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(thickness: 2.0,),
              ),
              RaisedButton(
                child: Text(dictionary.agree),
                onPressed: () => vm.navigateToCatalogsPage(),
              ),
            ],
          ),
        );
      }
    );
  }
}
