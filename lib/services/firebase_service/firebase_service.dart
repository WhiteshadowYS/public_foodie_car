import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static const tag = '[FirebaseService]';

  FirebaseService._privateConstructor();

  static final FirebaseService _instance = FirebaseService._privateConstructor();

  static FirebaseService get instance => _instance;

  final databaseReference = FirebaseDatabase.instance.reference();
  StreamSubscription<Event> _subscription;

  void listenChanges(String storageKey, void Function(String) onCatalogChangedFunction) async {
    await _subscription?.cancel();
    _subscription = databaseReference.onChildChanged.where((Event event) => event.snapshot.key == storageKey).listen(
      (Event event) {
        onCatalogChangedFunction(storageKey);
      },
    );
  }
}
