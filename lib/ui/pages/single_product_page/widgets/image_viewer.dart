import 'package:flutter/material.dart';

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
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(widget.gallery[index], fit: BoxFit.cover),
                );
              },
              itemCount: widget.gallery.length,
              controller: _pageController,
            ),
            SizedBox(
              height: 260.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageViewButton(
                    icon: Icons.arrow_back_ios,
                    jumpToPage: () => _pageController.jumpToPage(_getIndexBack()),
                  ),
                  ImageViewButton(
                    icon: Icons.arrow_forward_ios,
                    jumpToPage: () => _pageController.jumpToPage(_getIndexNext()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getIndexBack() {
    if (_pageController.page.floor() == 0) {
      return widget.gallery.length - 1;
    }
    return _pageController.page.floor() - 1;
  }

  int _getIndexNext() {
    if (_pageController.page.floor() == widget.gallery.length - 1) {
      return 0;
    }
    return _pageController.page.floor() + 1;
  }
}
