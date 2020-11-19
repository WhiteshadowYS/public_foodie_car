import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_project_template/ui/shared/fade_animation_container.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const CachedImage({
    @required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        height: height,
        width: width,
        placeholder: (BuildContext context, String url) {
          return FadeAnimationContainer();
        },
        errorWidget: (BuildContext context, String image, obj) {
          return SvgPicture.asset('');
        },
      ),
    );
  }
}
