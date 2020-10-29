import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/terms_page/terms_page_vm.dart';
import 'package:my_catalog/ui/pages/terms_page/widgets/carousel_indicator.dart';
import 'package:my_catalog/ui/pages/terms_page/widgets/terms_accept_block.dart';
import 'package:my_catalog/ui/pages/terms_page/widgets/terms_text_block.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

import 'widgets/agree_button.dart';

/// [TermsPage] It is shown to the user for the first time after the first login to the application, as well as whenever the rules of use change.
/// Terms and conditions text is getting from [TermsPageVM]
/// The user must approve those TOC by tapping on [AgreeButton]
/// After tapping on [AgreeButton] user goes to the [CatalogsPage]

class TermsPage extends StatefulWidget {
  TermsPage({
    @required this.isReadOnly,
  }) : super(key: Key('TermsPage'));

  final bool isReadOnly;

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  Timer timer;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final CarouselController _carouselController = CarouselController();
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: CustomTheme.colors.background,
        child: StoreConnector<AppState, TermsPageVM>(
          converter: TermsPageVM.fromStore,
          builder: (BuildContext context, TermsPageVM vm) {
            return MainLayout(
              bgColor: CustomTheme.colors.background,
              back: widget.isReadOnly ? null : () => back(vm),
              appBar: MainAppBar(
                height: 50.sp,
                key: TermsPageKeys.appbar,
                title: vm.titleText(vm.selectedLocale),
                backButtonText: widget.isReadOnly ? null : vm.backButtonText(vm.selectedLocale),
                backOnTap: widget.isReadOnly ? null : () => back(vm),
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 50.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ScrollConfiguration(
                      behavior: CleanBehavior(),
                      child: CarouselSlider(
                        carouselController: _carouselController,
                        items: [
                          TermsTextBlock(subtitle: vm.termsSubtitle(vm.selectedLocale), termsText: vm.termsText),
                          // TODO(Daniil): Add terms
                          TermsTextBlock(subtitle: vm.terms2Subtitle(vm.selectedLocale), termsText: vm.termsText2),
                        ],
                        options: CarouselOptions(
                          height: 380.h,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          onPageChanged: onChanged,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 12.0.h,
                        bottom: 8.0.h,
                      ),
                      height: 12.0.sp,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int i) {
                          return circleWidget(i);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.0.h),
                      child: const Divider(thickness: 1.0),
                    ),
                    if (!widget.isReadOnly) TermsAcceptBlock(vm: vm),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget circleWidget(int i) {
    if (i == _current) {
      return CarouselIndicator(isSelected: true);
    }
    return CarouselIndicator(isSelected: false);
  }

  void back(TermsPageVM vm) {
    timer?.cancel();
    vm.back();
  }

  void onChanged(int index, _) {
    _current = index;
    setState(() {});
  }
}
