import 'package:flutter/material.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/dialog_service.dart';

class DialogLayout extends StatelessWidget {
  final Widget child;

  const DialogLayout({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: DialogService.instance.close,
          ),
          child,
        ],
      ),
    );
  }
}
