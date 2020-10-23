import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class DialogCloseButton extends StatelessWidget {
  final String keyValue;

  DialogCloseButton({
    @required this.keyValue,
  }) : super(key: Key(keyValue));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25.0),
        onTap: DialogService.instance.close,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SVGImages().close(),
        ),
      ),
    );
  }
}
