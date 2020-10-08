import 'package:flutter/material.dart';
import 'file:///F:/src/projects/MyCatalog%20projects/MyCatalog/lib/services/focus_service/focus_service.dart';

class NextButtonTextField extends StatelessWidget {
  final String focusKeyValue;
  final FocusService focusService;
  final TextEditingController controller;

  NextButtonTextField({
    this.focusKeyValue,
    this.focusService,
    this.controller,
  }) : super(key: Key(focusKeyValue));

  bool get _isControllerHaveData {
    return controller.text != null && controller.text != '';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusService.getKeyByValue(focusKeyValue)?.focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        focusService.changeKeyOpeningStatus(
          status: !_isControllerHaveData,
          currentFocusKeyValue: focusKeyValue,
        );

        focusService.nextFocus(
          context: context,
          currentFocusKeyValue: focusKeyValue,
        );
      },
    );
  }
}
