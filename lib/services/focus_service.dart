import 'package:flutter/material.dart';

class FocusService {
  static const tag = '[FocusService]';

  final List<FocusKey> _keys = [];

  List<String> get getKeysValues => _keys.map<String>((e) => e.value).toList();

  void addKey(FocusKey key) => _keys.add(key);

  void addAllKeys(List<FocusKey> keys) => _keys.addAll(keys);

  void clearKeys() => _keys.clear();

  void nextFocus({BuildContext context, String currentFocusKeyValue}) {
    final FocusKey nKey = getFollowingKeyByValue(currentFocusKeyValue);

    if (nKey == null) {
      FocusScope.of(context).unfocus();
      return;
    }

    FocusScope.of(context).requestFocus(nKey.focusNode);
  }

  void changeKeyOpeningStatus({bool status, String currentFocusKeyValue}) {
    for (FocusKey key in _keys) {
      if (key.value == currentFocusKeyValue) {
        key.canBeOpened = status;
      }
    }
  }

  FocusKey getFollowingKeyByValue(String value) {
    final FocusKey selectedKey = getKeyByValue(value);
    if (selectedKey == null) return null;

    final int nextOrder = _findNextOrder(selectedKey);
    if (nextOrder == null) return null;

    final FocusKey nextKey = getKeyByOrder(nextOrder);
    if (nextKey == null) return null;

    return nextKey;
  }

  FocusKey getKeyByValue(String value) {
    final int index = _keys.indexWhere((e) => e.value == value);

    if (index == -1) {
      print('$tag => <getKeyByValue> => key not found');
      return null;
    }

    return _keys[index];
  }

  FocusKey getKeyByOrder(int order) {
    final int index = _keys.indexWhere((e) => e.order == order);

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
        final FocusKey nextKey = getKeyByOrder(nKey.order);

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
      print('$tag => <_findNextOrder> => new order == old order');
      return null;
    }

    if (tmpOrder == FocusKey.maxKeyValue) {
      print('$tag => <_findNextOrder> => maxKeyValue was found');
      return null;
    }

    return tmpOrder;
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


