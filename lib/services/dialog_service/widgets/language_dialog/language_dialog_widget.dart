import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/language_dialog.dart';
import 'package:my_catalog/services/dialog_service/widgets/language_dialog/language_dialog_vm.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class LanguageDialogWidget extends StatelessWidget {
  final LanguageDialog dialog;

  LanguageDialogWidget({
    @required String key,
    this.dialog,
  }) : super(key: Key(key));

  void onPop(LanguageDialogVM vm) {
    final int index = dialog.list.indexWhere((language) {
      return language.name == dialog.selectedLanguage;
    });

    if (index == null || index == -1) {
      DialogService.instance.close();
      return;
    }

    dialog.onItemSelected(dialog.list[index].code);
    DialogService.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LanguageDialogVM>(
      converter: LanguageDialogVM.fromStore,
      builder: (BuildContext context, LanguageDialogVM vm) {
        return Directionality(
          textDirection: vm.textDirection ?? TextDirection.ltr,
          child: WillPopScope(
            onWillPop: () async {
              onPop(vm);
              return false;
            },
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onPop(vm),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: 1.0,
                          ),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () => onPop(vm),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CustomTheme.colors.popupBackground,
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 44.0),
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                height: dialog.list.length * 55.sp + 88.h < MediaQuery.of(context).size.height * 0.6.sp
                                    ? dialog.list.length * 55.sp + 88.h
                                    : MediaQuery.of(context).size.height * 0.6.sp,
                                child: CleanedListView(
                                  keyValue: '${key.toString()}CleanedListView',
                                  children: dialog.list.map((language) {
                                    return LanguageItem(
                                      key: '${key.toString()}LanguageItem${language.name}',
                                      language: language,
                                      textDirection: vm.textDirection,
                                      isSelected: _getIsSelected(language, dialog.selectedLanguage),
                                      callback: () {
                                        if (language.code != dialog.selectedLanguage) dialog.onItemSelected(language.code);
                                        DialogService.instance.close();
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

bool _getIsSelected(LanguageModel language, String selectedLanguage) {
  if (selectedLanguage == null) {
    return language.isDefault ?? false;
  }

  return language.name == selectedLanguage;
}

class LanguageItem extends StatelessWidget {
  final TextDirection textDirection;
  final LanguageModel language;
  final Function callback;
  final bool isSelected;

  LanguageItem({
    @required String key,
    @required this.language,
    @required this.textDirection,
    this.isSelected = false,
    this.callback,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.sp,
      child: Material(
        color: Colors.transparent,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: InkWell(
            onTap: callback,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language.name,
                          style: isSelected
                              ? CustomTheme.textStyles.accentTextStyle(size: 14.sp, fontWeight: FontWeight.bold)
                              : CustomTheme.textStyles.titleTextStyle(size: 14.sp),
                        ),
                        Transform.rotate(
                          angle: textDirection != TextDirection.ltr ? pi : 0,
                          child: SizedBox(
                            height: 20.sp,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 18.sp,
                              color: isSelected ? CustomTheme.colors.accentFont : CustomTheme.colors.minorFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.sp,
                  ),
                  height: 1.h,
                  width: double.infinity,
                  color: CustomTheme.colors.font.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
