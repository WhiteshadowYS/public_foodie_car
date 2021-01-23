import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/about_page/widgets/info_container.dart';
import 'package:maps/maps.dart';

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
            text: 'Description Text',
          ),
          InfoContainer(
            key: Key('InfoContainer2'),
            icon: Icons.phone,
            text: '+38080808080',
          ),
          InfoContainer(
            key: Key('InfoContainer4'),
            icon: Icons.navigation,
            text: 'Test Address',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: MapWidget(
              adapter: MapAdapter.platformSpecific(
                ios: AppleMapsNativeAdapter(),
                otherwise: BingMapsIframeAdapter(),
              ),
              location: MapLocation(
                zoom: Zoom(13),
                geoPoint: GeoPoint(46.4775, 30.7326),
                // query: 'ukraine',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
