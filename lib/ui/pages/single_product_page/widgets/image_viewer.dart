import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';

import 'image_view_button.dart';

class ImageViewer extends StatefulWidget {
  final List<String> gallery;

  ImageViewer({
    @required String key,
    @required this.gallery,
  })  : assert(gallery != null),
        super(key: Key(key));

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              items: [
                for (String image in widget.gallery)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            ImageAssets.LOGO,
                            height: 80.0,
                            fit: BoxFit.fitHeight,
                            color: CustomTheme.colors.buttons,
                          ),
                        ),
                        SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.network(image, fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  )
              ],
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 8),
              ),
            ),
            SizedBox(
              height: 260.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageViewButton(
                    icon: Icons.arrow_back_ios,
                    jumpToPage: _carouselController.previousPage,
                  ),
                  ImageViewButton(
                    icon: Icons.arrow_forward_ios,
                    jumpToPage: _carouselController.nextPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
