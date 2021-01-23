import 'package:flutter/material.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/cafe_state/cafe_selector.dart';
import 'package:redux/redux.dart';

class GalleryVM {
  final List<String> galleryImages;

  const GalleryVM({
    @required this.galleryImages,
  });

  static GalleryVM init(Store<AppState> store) {
    return GalleryVM(
      galleryImages: CafeSelector.getCafeGallery(store),
    );
  }
}
