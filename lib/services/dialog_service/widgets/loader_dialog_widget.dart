import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/services/dialog_service/models/default_loader_dialog.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class LoaderDialogWidget extends StatelessWidget {
  final DefaultLoaderDialog loaderModel;

  LoaderDialogWidget(this.loaderModel) : super(key: Key('LoaderDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.kBlack.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            ImageAssets.LOADING,
            height: 50.0,
            width: 50.0,
            color: CustomTheme.colors.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Material(
              color: Colors.transparent,
              child: Text(
                FlutterDictionary.instance.language.popUpDictionary.loading,
                style: TextStyle(color: AppColors.kWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
