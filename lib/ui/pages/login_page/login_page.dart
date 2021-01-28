import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_car_template/ui/pages/login_page/login_page_vm.dart';
import 'package:foodie_car_template/ui/widgets/app_button.dart';
import 'package:foodie_car_template/ui/widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  final lng = FlutterDictionary.instance.language;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      key: Key('[LoginPage]'),
      child: StoreConnector<AppState, LoginPageVM>(
        converter: LoginPageVM.init,
        builder: (BuildContext context, LoginPageVM vm) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        lng.loginPage.title,
                        style: CustomTheme.textStyles.accentTextStyle(
                          size: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    AppTextField(
                      keyValue: 'emailField-',
                      controller: _emailController,
                      hintText: lng.loginPage.emailHint,
                    ),
                    const SizedBox(height: 8.0),
                    AppTextField(
                      keyValue: 'passField-',
                      controller: _passController,
                      hintText: lng.loginPage.passwordHint,
                    ),
                    const SizedBox(height: 100.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: AppButton(
                        radius: 20.0,
                        height: 48.0,
                        onTap: () => vm.login(
                          _emailController.text,
                          _passController.text,
                        ),
                        child: Text(
                          lng.loginPage.title,
                          style: CustomTheme.textStyles.buttonTextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (vm.isLoading)
                Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  color: CustomTheme.colors.primaryColor.withOpacity(0.2),
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
