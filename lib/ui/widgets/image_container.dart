import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie_car_template/data/res/image_assets.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  ImageContainer({
    @required Key key,
    @required this.imageUrl,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl ?? '',
      imageBuilder: (BuildContext context, ImageProvider provider) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Image(
            fit: fit,
            image: provider,
          ),
        );
      },
      placeholder: (BuildContext context, String str) {
        return Image.asset(
          ImageAssets.appIcon,
          fit: BoxFit.contain,
        );
      },
      errorWidget: (BuildContext context, String str, _) {
        return Image.asset(
          ImageAssets.appIcon,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
