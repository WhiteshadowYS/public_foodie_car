import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/dictionary_classes/terms_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/services/dialog_service/widgets/dialog_main_button.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/pages/terms_page/terms_page_vm.dart';
import 'package:my_catalog/ui/pages/terms_page/widgets/agree_button.dart';

class TermsAcceptBlock extends StatefulWidget {
  final TermsPageVM vm;

  TermsAcceptBlock({@required this.vm}) : super(key: Key(TermsPageKeys.acceptBlock));

  @override
  _TermsAcceptBlockState createState() => _TermsAcceptBlockState();
}

class _TermsAcceptBlockState extends State<TermsAcceptBlock> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    final TermsPageDictionary dictionary = FlutterDictionary.instance.language.termsPageDictionary;
    return Column(
      children: [
        /// [AgreeButton] takes [dictionary.agree] text as title
        AgreeButton(
          keyValue: TermsPageKeys.button,
          onTap: () {
            setState(() {
              isAccepted = !isAccepted;
            });
          },
          isAccepted: isAccepted,
          title: widget.vm.buttonText(widget.vm.selectedLocale),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),

          /// [DialogMainButton ] takes [vm.acceptTermsAndNavigate]  as onTap function
          child: DialogMainButton(
            keyValue: TermsPageKeys.goToCatalogButton,
            title: dictionary.goToCatalog,
            textColor: CustomTheme.colors.background,
            backgroundColor: isAccepted ? CustomTheme.colors.primaryColor : CustomTheme.colors.accentColor,
            onTap: isAccepted ? widget.vm.acceptTermsAndNavigate : null,
          ),
        ),
      ],
    );
  }
}
