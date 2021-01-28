import 'package:flutter/material.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/phone_dialog.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/shared/dialog_layout/dialog_layout.dart';
import 'package:foodie_car_template/ui/widgets/app_button.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneDialogWidget extends StatelessWidget {
  final PhoneDialog data;

  const PhoneDialogWidget({
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Container(
        height: 300.0,
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
                child: Text(
                  data.phone,
                  style: CustomTheme.textStyles.mainTextStyle(
                    size: 20.0,
                  ),
                ),
              ),
            ),
            AppButton(
              onTap: () => launch('tel:${data.phone}'),
              radius: 10.0,
              width: 200.0,
              child: Text(
                'Позвонить',
                style: CustomTheme.textStyles.buttonTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
