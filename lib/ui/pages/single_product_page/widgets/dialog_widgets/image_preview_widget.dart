import 'package:flutter/material.dart';
import 'package:my_catalog/res/image_assets.dart';

class ImagePreviewWidget extends StatelessWidget {
  final String imageUrl;

  ImagePreviewWidget({@required this.imageUrl})
      : assert(imageUrl != null, throw ('imageUrl should be not null')),
        super(key: Key('ImagePreviewWidget'));

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage(ImageAssets.LOGO_PNG),
      image: NetworkImage(imageUrl),
      fit: BoxFit.cover,
    );
  }
}
