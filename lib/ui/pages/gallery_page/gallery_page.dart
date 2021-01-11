import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/gallery_page/gallery_page_vm.dart';
import 'package:foodie_client_template/ui/pages/gallery_page/widgets/gallery_item.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GalleryVM>(
      converter: GalleryVM.init,
      builder: (BuildContext context, GalleryVM vm) {
        return MainLayout(
          key: Key('[GalleryPage]'),
          child: GridView.builder(
            key: Key('[GalleryPage][Grid]'),
            padding: const EdgeInsets.all(8.0),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GalleryItem(
                key: Key('[GalleryPage][Grid][$index]'),
                url: 'https://static.toiimg.com/photo/72975551.cms',
              );
            },
          ),
        );
      },
    );
  }
}
