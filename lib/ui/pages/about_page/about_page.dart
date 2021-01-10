import 'package:flutter/material.dart';
import 'package:foody_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foody_client_template/ui/pages/about_page/widgets/info_container.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      key: Key('[AboutPage]'),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        children: [
          InfoContainer(
            key: Key('InfoContainer1'),
            icon: Icons.home,
            text: 'Hello',
          ),
          InfoContainer(
            key: Key('InfoContainer2'),
            icon: Icons.home,
            text: 'Hello',
          ),
          InfoContainer(
            key: Key('InfoContainer3'),
            icon: Icons.home,
            text: 'Hello',
          ),
          InfoContainer(
            key: Key('InfoContainer4'),
            icon: Icons.home,
            text: 'Hello',
          ),
        ],
      ),
    );
  }
}
