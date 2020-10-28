import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

import 'image_view_button.dart';

class ImageViewer extends StatefulWidget {
  final String keyValue;
  final List<Widget> cachedImagesGalery;
  final void Function(List<Widget> gallery, int currentIndex) showGallery;

  ImageViewer({
    @required this.keyValue,
    @required this.cachedImagesGalery,
    @required this.showGallery,
  })  : assert(cachedImagesGalery != null),
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
                for (Widget cachedImage in widget.cachedImagesGalery)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () => widget.showGallery(widget.cachedImagesGalery, widget.cachedImagesGalery.indexOf(cachedImage)),
                        child: cachedImage,
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
