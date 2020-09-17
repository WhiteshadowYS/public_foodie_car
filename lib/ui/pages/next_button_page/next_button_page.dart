import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:pictures_view/ui/layouts/main_layout/main_layout.dart';
import 'package:pictures_view/widgets/dialog/dialog.dart';

class NextButtonPage extends StatefulWidget {
  @override
  _NextButtonPageState createState() => _NextButtonPageState();
}

class _NextButtonPageState extends State<NextButtonPage> {
  FocusManager focusManager = FocusManager();

  @override
  void initState() {
    focusManager.addAllKeys([
      FocusKey(
        value: '1',
        order: 1,
      ),
      FocusKey(
        value: '2',
        order: 2,
      ),
      FocusKey(
        value: '3',
        order: 3,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(),
      child: Column(
        children: <Widget>[
          NextButtonTextField(
            focusKeyValue: '1',
            focusManager: focusManager,
          ),
          NextButtonDropdown(
            focusKeyValue: '2',
            focusManager: focusManager,
          ),
          NextButtonTextField(
            focusKeyValue: '3',
            focusManager: focusManager,
          ),
        ],
      ),
    );
  }
}


class NextButtonDropdown extends StatefulWidget {
  final String focusKeyValue;
  final FocusManager focusManager;

  NextButtonDropdown({
    this.focusKeyValue,
    this.focusManager,
  });

  @override
  _NextButtonDropdownState createState() => _NextButtonDropdownState();
}

class _NextButtonDropdownState extends State<NextButtonDropdown> {
  FocusKey focusKey;

  @override
  void initState() {
    focusKey = widget.focusManager.getKeyByValue(widget.focusKeyValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          FocusableActionDetector(
            focusNode: focusKey?.focusNode,
            onFocusChange: (bool isFocused) {
              print('isFocused: $isFocused');
              if (isFocused) {
                showFunction();
              } else {
//                Navigator.pop(context);
              }
            },
            child: Container(
              color: Colors.red,
              width: 100,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }

  void showFunction(){
    showClientDropdown(
      context: context,
      title: 'Title',
      list: [
        {'name': 'a'},
        {'name': 'b'},
        {'name': 'c'},
      ],
      printedParam: 'name',
      whenSheetDispose: (bool isForce) {
        print('isForce: $isForce');
        if (!isForce) {
          FocusScope.of(context).unfocus();
        }
      },
      onItemSelected: (int index) {
        print('index: $index');

        Navigator.pop(context);
        FocusKey nKey = widget.focusManager.getFollowingKeyByValue(widget.focusKeyValue);
        if (nKey == null) {
          FocusScope.of(context).unfocus();
          return;
        }

        FocusScope.of(context).requestFocus(nKey.focusNode);
      },
    );
  }
}

class NextButtonTextField extends StatelessWidget {
  final String focusKeyValue;
  final FocusManager focusManager;

  NextButtonTextField({
    this.focusKeyValue,
    this.focusManager,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusManager.getKeyByValue(focusKeyValue)?.focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        FocusKey nKey = focusManager.getFollowingKeyByValue(focusKeyValue);
        if (nKey == null) {
          FocusScope.of(context).unfocus();
          return;
        }

        FocusScope.of(context).requestFocus(nKey.focusNode);
      },
    );
  }
}

class FocusKey {
  final String value;
  final int order;
  final FocusNode focusNode = FocusNode();
  bool canBeOpened;

  FocusKey({
    @required this.value,
    @required this.order,
    this.canBeOpened = true,
  });

  static const int maxKeyValue = 99999;

  @override
  String toString() {
    return 'FocusKey{value: $value, order: $order, focusNode: $focusNode, canBeOpened: $canBeOpened}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FocusKey &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          order == other.order &&
          focusNode == other.focusNode &&
          canBeOpened == other.canBeOpened;

  @override
  int get hashCode => value.hashCode ^ order.hashCode ^ focusNode.hashCode ^ canBeOpened.hashCode;
}

class FocusManager {
  static const tag = '[FocusManager]';

  final List<FocusKey> _keys = [];

  List<String> get getKeysValues => _keys.map<String>((e) => e.value).toList();

  void addKey(FocusKey key) => _keys.add(key);

  void addAllKeys(List<FocusKey> keys) => _keys.addAll(keys);

  void clearKeys() => _keys.clear();

  FocusKey getFollowingKeyByValue(String value) {
    FocusKey selectedKey = getKeyByValue(value);
    if (selectedKey == null) return null;

    int nextOrder = _findNextOrder(selectedKey);
    if (nextOrder == null) return null;

    FocusKey nextKey = getKeyByOrder(nextOrder);
    if (nextKey == null) return null;

    return nextKey;
  }

  FocusKey getKeyByValue(String value) {
    int index = _keys.indexWhere((e) => e.value == value);

    if (index == -1) {
      print('$tag => <getKeyByValue> => key not found');
      return null;
    }

    return _keys[index];
  }

  FocusKey getKeyByOrder(int order) {
    int index = _keys.indexWhere((e) => e.order == order);

    if (index == -1) {
      print('$tag => <getKeyByValue> => key not found');
      return null;
    }

    return _keys[index];
  }

  int _findNextOrder(FocusKey key) {
    int tmpOrder = FocusKey.maxKeyValue;

    for (FocusKey nKey in _keys) {
      if (nKey.order > key.order && nKey.order < tmpOrder) {
        FocusKey nextKey = getKeyByOrder(nKey.order);

        if (nextKey.focusNode.context == null) {
          print('$tag => <_findNextOrder> => key found without clients => continue');
          continue;
        }

        if (!nextKey.canBeOpened) {
          print('$tag => <_findNextOrder> => key found but cant be opened => continue');
          continue;
        }

        tmpOrder = nKey.order;
      }
    }

    if (tmpOrder == key.order) {
      print('$tag => <_findNextOrder> => new oreder == old order');
      return null;
    }

    if (tmpOrder == FocusKey.maxKeyValue) {
      print('$tag => <_findNextOrder> => maxKeyValue was found');
      return null;
    }

    return tmpOrder;
  }
}
