import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/services/dialog_service/models/dialog_layout.dart';
import 'package:my_catalog/services/dialog_service/models/image_view_dialog.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/image_view_button.dart';
import 'package:my_catalog/widgets/fade_animation_container.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  bool _init = false;

  @override
  void initState() {
    index = widget.dialog.currentIndex;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init = true;
      setState(() {});
    });
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
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: PhotoView.customChild(
                    minScale: 0.7,
                    maxScale: 2.5,
                    childSize: Size(200.0, 200.0),
                    controller: _photoViewController,
                    backgroundDecoration: BoxDecoration(color: AppColors.kBlack.withOpacity(0)),
                    child: CachedNetworkImage(
                      imageUrl: widget.dialog.gallery[index],
                      imageBuilder: (ctx, image) {
                        return Image(image: image);
                      },
                      placeholder: (ctx, image) {
                        return FadeAnimationContainer();
                      },
//                      child: FadeAnimationContainer(
//                        key: 'ImageViewDialog',
//                        placeholder: Image.asset(ImageAssets.LOGO_FULL_PNG),
//                        image:,
//                      ),
                    ),
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
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: CustomTheme.colors.primaryColor.withOpacity(0.4),
                  highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(60.0),
                  onTap: Navigator.of(context, rootNavigator: true).pop,
                  child: AnimatedOpacity(
                    curve: Curves.easeInBack,
                    duration: Duration(milliseconds: 800),
                    opacity: _init ? 1.0 : 0.0,
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      child: Icon(Icons.close, size: 30.0, color: CustomTheme.colors.primaryColor),
                    ),
                  ),
                ),
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
