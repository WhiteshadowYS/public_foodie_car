import 'package:flutter/material.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

class ImagePreviewWidget extends StatelessWidget {
  final String imageUrl;

  ImagePreviewWidget({@required this.imageUrl})
      : assert(imageUrl != null, throw ('imageUrl should be not null')),
        super(key: Key('ImagePreviewWidget'));

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      key: Key(key.toString() + 'CachedImage'),
      imageUrl: imageUrl ?? '',
    );
  }
}
