import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/dictionary/dictionary_classes/terms_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/terms_page/terms_page_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/agree_button.dart';

class TermsPage extends StatelessWidget {
  TermsPage() : super(key: Key('TermsPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TermsPageVM>(
      converter: TermsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        final TermsPageDictionary dictionary = FlutterDictionary.instance.language.termsPageDictionary;
        return MainLayout(
          child: Container(
            margin: EdgeInsets.only(
              left: 16.w,
              right: 37.w,
              top: 50.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dictionary.title,
                    style: CustomTheme.textStyles.titleTextStyle(size: 18.0),
                  ),
                  SizedBox(height: 56.h),
                  // TODO(Daniil): Use theme primary textStyle
                  Text(vm.termsText),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0.h),
                    child: const Divider(thickness: 1.5),
                  ),
                  AgreeButton(
                    onTap: () => vm.navigateToCatalogsPage(),
                    title: dictionary.agree,
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
