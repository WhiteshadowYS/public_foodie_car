import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/dropdown_model.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/focus_service.dart';

class NextButtonDropdown extends StatefulWidget {
  final String focusKeyValue;
  final FocusService focusService;

  final String title;
  final String printedParam;

  final List<Map<String, dynamic>> list;

  final void Function(dynamic) onSelectItem;
  final void Function(DropdownModel) showDropdown;

  NextButtonDropdown({
    this.focusKeyValue,
    this.focusService,
    this.title,
    this.list,
    this.printedParam,
    this.onSelectItem,
    this.showDropdown,
  }) : super(key: Key(focusKeyValue));

  @override
  _NextButtonDropdownState createState() => _NextButtonDropdownState();
}

class _NextButtonDropdownState extends State<NextButtonDropdown> {
  FocusKey focusKey;

  @override
  void initState() {
    super.initState();
    focusKey = widget.focusService.getKeyByValue(widget.focusKeyValue);
  }

  void show() {
    widget.showDropdown(
      DropdownModel(
        title: widget.title,
        printedParam: widget.printedParam,
        list: widget.list,
        onItemSelected: (int index) {
          DialogService.instance.close();

          widget.focusService.changeKeyOpeningStatus(
            status: false,
            currentFocusKeyValue: widget.focusKeyValue,
          );
        },
        whenSheetDispose: (bool isForce) {
          if (isForce) return;

          widget.focusService.nextFocus(
            context: context,
            currentFocusKeyValue: widget.focusKeyValue,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusKey.focusNode,
      onFocusChange: (bool isFocused) {
        if (isFocused) {
          show();
        }
      },
      child: RaisedButton(
        onPressed: () => show(),
      ),
    );
  }
}
