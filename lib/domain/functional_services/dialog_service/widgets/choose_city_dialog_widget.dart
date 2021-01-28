import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/domain/entity/city/city.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/choose_city_dialog.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/shared/dialog_layout/dialog_layout.dart';

class ChooseCityDialogWidget extends StatelessWidget {
  final ChooseCityDialog data;

  const ChooseCityDialogWidget(this.data) : super(key: const Key('[ChooseLanguageDialogWidget]'));

  void selectFunction(City city) {
    data.selectCity(city);
    DialogService.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Center(
        child: Container(
          height: 300.sp,
          decoration: BoxDecoration(
            color: CustomTheme.colors.popupBackground,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 24.sp,
          ),
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: data.locations?.map((location) {
                  return ListTile(
                    onTap: () => selectFunction(location),
                    title: Text(location.name),
                  );
                })?.toList() ??
                [],
          ),
        ),
      ),
    );
  }
}
