import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:my_catalog/res/const.dart';

class FirebaseService {
  static const tag = '[FirebaseService]';

  FirebaseService._privateConstructor();

  static final FirebaseService _instance = FirebaseService._privateConstructor();

  static FirebaseService get instance => _instance;

  final databaseReference = FirebaseDatabase.instance.reference();
  StreamSubscription<Event> _subscription;

  void listenChanges(String storageKey, void Function(String, int) getData) async {
    await _subscription?.cancel();
    _subscription = databaseReference.onChildChanged.where((Event event) => event.snapshot.key == storageKey).listen(
      (Event event) {
        logger.i('Update: ${event.snapshot.value}');
        getData(storageKey, event.snapshot.value);
      },
    );
  }

  Future<dynamic> getStoresVersions() async {
    final DataSnapshot data = await databaseReference.once();

    logger.i('Loaded data: ${data.value}, type: ${data.value.runtimeType}');

    return data.value;
  }
}
