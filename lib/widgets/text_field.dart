import 'package:flutter/material.dart';
import 'package:pictures_view/services/focus_service.dart';

class NextButtonTextField extends StatelessWidget {
  final String focusKeyValue;
  final FocusService focusService;

  NextButtonTextField({
    this.focusKeyValue,
    this.focusService,
  }) : super(key: Key(focusKeyValue));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusService.getKeyByValue(focusKeyValue)?.focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        final FocusKey nKey = focusService.getFollowingKeyByValue(focusKeyValue);
        if (nKey == null) {
          FocusScope.of(context).unfocus();
          return;
        }

        FocusScope.of(context).requestFocus(nKey.focusNode);
      },
    );
  }
}
