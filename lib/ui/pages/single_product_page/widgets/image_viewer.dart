import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/widgets/fade_animation_container.dart';

import 'image_view_button.dart';

class ImageViewer extends StatefulWidget {
  final String keyValue;
  final List<String> gallery;
  final void Function(List<String> gallery, int currentIndex) showGallery;

  ImageViewer({
    @required this.keyValue,
    @required this.gallery,
    @required this.showGallery,
  })  : assert(gallery != null),
        super(key: Key(keyValue + 'ImageViewer'));

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
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              items: [
                for (String image in widget.gallery)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () => widget.showGallery(widget.gallery, widget.gallery.indexOf(image)),
                        child: FadeAnimationContainer(),
                      ),
                    ),
                  )
              ],
              options: CarouselOptions(
                height: 260.0,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: Duration(seconds: 8),
              ),
            ),
            SizedBox(
              height: 260.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageViewButton(
                    keyValue: 'back_button',
                    icon: Icons.arrow_back_ios,
                    jumpToPage: _carouselController.previousPage,
                  ),
                  ImageViewButton(
                    keyValue: 'forward_button',
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
