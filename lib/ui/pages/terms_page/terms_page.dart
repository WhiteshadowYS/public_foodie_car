import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/dictionary/dictionary_classes/terms_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/terms_page/terms_page_vm.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';

import 'widgets/agree_button.dart';

/// [TermsPage] It is shown to the user for the first time after the first login to the application, as well as whenever the rules of use change.
/// Terms and conditions text is getting from [TermsPageVM]
/// The user must approve those TOC by tapping on [AgreeButton]
/// After tapping on [AgreeButton] user goes to the [CatalogsPage]

class TermsPage extends StatefulWidget {
  TermsPage() : super(key: Key('TermsPage'));

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  Timer timer;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TermsPageVM>(
      converter: TermsPageVM.fromStore,
      builder: (BuildContext context, TermsPageVM vm) {
        final TermsPageDictionary dictionary = FlutterDictionary.instance.language.termsPageDictionary;
        return MainLayout(
          back: () => back(vm),
          appBar: MainAppBar(
            key: 'TACPageAppBar',
            title: dictionary.title,
            backOnTap: () => back(vm),
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 50.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO(Daniil): Use theme primary textStyle
                  Text(vm.termsText),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0.h),
                    child: const Divider(thickness: 1.0),
                  ),

                  /// [AgreeButton] takes [vm.navigateToCatalogsPage] as onTap function and [dictionary.agree] text as title
                  AgreeButton(
                    onTap: () {
                      timer = Timer(Duration(milliseconds: 1500), () {
                        if (isAccepted) {
                          vm.navigateToCatalogsPage();
                        }
                      });

                      setState(() {
                        isAccepted = !isAccepted;
                      });
                    },
                    isAccepted: isAccepted,
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

  void back(TermsPageVM vm) {
    timer.cancel();

    vm.navigateToMainPage();
  }
}
