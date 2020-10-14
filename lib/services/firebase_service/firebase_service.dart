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

  void listenChanges(int id, void Function(int, int) getData) async {
    await _subscription?.cancel();
    _subscription = databaseReference.onChildChanged.where((Event event) => event.snapshot.key == id.toString()).listen(
      (Event event) {
        logger.d('$tag => <listenChanges> => id: $id, new version: ${event.snapshot.value}');
        getData(id, event.snapshot.value);
      },
    );
  }

  Future<dynamic> getStoresVersions() async {
    final DataSnapshot data = await databaseReference.once();

    logger.d('Loaded data: ${data.value}, type: ${data.value.runtimeType}');

    return data.value;
  }
}
