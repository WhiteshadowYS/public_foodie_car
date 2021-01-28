import 'package:flutter/material.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/map_dialog.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/shared/dialog_layout/dialog_layout.dart';
import 'package:foodie_car_template/ui/widgets/app_button.dart';
import 'package:maps/maps.dart';
import 'package:maps_adapter_google_maps/maps_adapter_google_maps.dart';

class MapDialogWidget extends StatefulWidget {
  final MapDialog data;

  const MapDialogWidget({
    @required this.data,
  });

  @override
  _MapDialogWidgetState createState() => _MapDialogWidgetState();
}

class _MapDialogWidgetState extends State<MapDialogWidget> {
  bool _isLoaded = false;

  // @override
  // void initState() {
  //   MapAdapter.defaultInstance = await MapAdapter.platformSpecific(
  //     otherwise: GoogleMapsNativeAdapter(),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Container(
        height: 500.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomTheme.colors.popupBackground,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: MapWidget(
                  location: MapLocation(
                    // query: 'Paris',
                    geoPoint: GeoPoint(100, 100),
                    zoom: Zoom(4.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
