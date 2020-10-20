import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/services/dialog_service/models/dialog_layout.dart';
import 'package:my_catalog/services/dialog_service/models/image_view_dialog.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/image_view_button.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewDialogWidget extends StatefulWidget {
  final ImageViewDialog dialog;

  ImageViewDialogWidget({
    @required String key,
    this.dialog,
  }) : super(key: Key(key));

  @override
  _ImageViewDialogWidgetState createState() => _ImageViewDialogWidgetState();
}

class _ImageViewDialogWidgetState extends State<ImageViewDialogWidget> {
  final PhotoViewController _photoViewController = PhotoViewController();
  int index;

  @override
  void initState() {
    index = widget.dialog.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      margin: EdgeInsets.zero,
      background: AppColors.kBlack.withOpacity(0),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: PhotoView.customChild(
                  controller: _photoViewController,
                  backgroundDecoration: BoxDecoration(color: AppColors.kBlack.withOpacity(0)),
                  child: FadeInImage(
                    placeholder: AssetImage(ImageAssets.LOADING),
                    image: NetworkImage(widget.dialog.gallery[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageViewButton(
                    keyValue: 'back_button',
                    icon: Icons.arrow_back_ios,
                    jumpToPage: _backPhoto,
                  ),
                  ImageViewButton(
                    keyValue: 'forward_button',
                    icon: Icons.arrow_forward_ios,
                    jumpToPage: _nextPhoto,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.white.withOpacity(0.5),
              child: InkWell(
                onTap: Navigator.of(context, rootNavigator: true).pop,
                child: Icon(Icons.close, size: 30, color: CustomTheme.colors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _backPhoto() {
    if (index == 0) {
      index = widget.dialog.gallery.length - 1;
    } else {
      --index;
    }
    _photoViewController.reset();
    setState(() {});
  }

  void _nextPhoto() {
    if (index == widget.dialog.gallery.length - 1) {
      index = 0;
    } else {
      ++index;
    }
    _photoViewController.reset();
    setState(() {});
  }
}
