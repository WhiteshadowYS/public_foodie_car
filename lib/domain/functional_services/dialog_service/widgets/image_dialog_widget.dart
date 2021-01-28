import 'package:flutter/material.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/image_dialog.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/shared/dialog_layout/dialog_layout.dart';

class ImageDialogWidget extends StatelessWidget {
  final ImageDialog data;

  const ImageDialogWidget({
    @required Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: InteractiveViewer(
        panEnabled: false, // Set it to false
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 2,
        child: Image(
          image: data.imageProvider,
        ),
      ),
    );
  }
}
