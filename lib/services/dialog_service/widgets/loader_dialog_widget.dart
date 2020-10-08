import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/services/dialog_service/models/default_loader_dialog.dart';

class LoaderDialogWidget extends StatelessWidget {
  final DefaultLoaderDialog loaderModel;

  LoaderDialogWidget(this.loaderModel) : super(key: Key('LoaderDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.kBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ImageAssets.LOADING,
            height: 50.0,
            width: 50.0,
            // TODO(Daniil): Use theme color
            color: AppColors.kGreen,
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
