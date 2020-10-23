import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/notification_dialog.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class NotificationDialogWidget extends StatelessWidget {
  final NotificationDialog dialogModel;

  NotificationDialogWidget(this.dialogModel) : super(key: Key('ErrorDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: Column(
          children: [
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 16.0
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 30.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 30.0,
                        ),
                        child: dialogModel.logoUrl != null && dialogModel.logoUrl != ''
                            ? Image.network(
                                dialogModel.logoUrl
                              )
                            : SVGImages().mcLogo(),
                      ),
                      Text(
                        dialogModel.title,
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      Text(
                        dialogModel.message,
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      InkWell(
                        onTap: () {
                          DialogService.instance.close();
                        },
                        child: Container(
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF5db075),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Text(
                            'Got it',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 58.0,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 22.0,
                    right: 6.0,
                    child: InkWell(
                      onTap: () => DialogService.instance.close(),
                      child: SVGImages().close(),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
