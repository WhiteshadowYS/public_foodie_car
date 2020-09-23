import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:pictures_view/res/routes.dart';
import 'package:pictures_view/ui/layouts/main_layout/main_layout.dart';
import 'package:pictures_view/widgets/cashed_network_image.dart';

class HomePage extends StatelessWidget {
  HomePage() : super(key: Key('HomePage'));

  final List<String> urlImages = [
    for (int i = 0; i < 20; i++) ...[
      'https://i.insider.com/5eb031e1e3c3fb77d21c342e?width=1100&format=jpeg&auto=webp',
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => NavigatorHolder.navigatorKey.currentState.pushNamed(Routes.nextButton),
          ),
        ],
      ),
      child: GridView.builder(
        key: Key('Grid'),
        itemCount: urlImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: CachedImage(
              height: 200.0,
              width: 200.0,
              imageUrl: urlImages[index],
            ),
          );
        },
      ),
    );
  }
}
