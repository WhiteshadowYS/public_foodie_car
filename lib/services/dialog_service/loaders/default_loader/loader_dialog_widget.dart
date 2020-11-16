import 'package:flutter/material.dart';
import 'package:base_project_template/res/app_styles/app_colors.dart';
import 'package:base_project_template/services/dialog_service/loaders/default_loader/default_loader.dart';
import 'package:base_project_template/ui/shared/fade_animation_container.dart';

class LoaderDialogWidget extends StatelessWidget {
  final DefaultLoaderDialog loaderModel;

  LoaderDialogWidget(this.loaderModel) : super(key: Key('LoaderDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.kBlack.withOpacity(0.3),
      child: FadeAnimationContainer(),
    );
  }
}
