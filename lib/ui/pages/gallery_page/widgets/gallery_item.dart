import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody_client_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:foody_client_template/domain/functional_services/dialog_service/models/image_dialog.dart';

class GalleryItem extends StatelessWidget {
  final String url;

  const GalleryItem({
    Key key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = CachedNetworkImageProvider(url);

    return InkWell(
      onTap: () {
        DialogService.instance.show(ImageDialog(
          imageProvider: imageProvider,
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
        height: 140.sp,
      ),
    );
  }
}
