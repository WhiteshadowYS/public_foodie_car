import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:my_catalog/res/const.dart';


/// [FirebaseService] it is service for work with firebase.
/// This class it - Singleton, for function using use [FirebaseService.instance]
/// - [listenChanges] function for listening changes from realtime database.
///   [databaseReference] Gets a DatabaseReference for the root of your Firebase Database.
///   [_subscription] is used to subscribe or unsubscribe from the events of firebase rtdb

class FirebaseService {
  static const tag = '[FirebaseService]';

  FirebaseService._privateConstructor();

  static final FirebaseService _instance = FirebaseService._privateConstructor();

  static FirebaseService get instance => _instance;

  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  StreamSubscription<Event> _subscription;

  void listenChanges(int id, void Function(int, int) getData) async {
   // await _subscription?.cancel();
    await unsubscribeFromUpdates();
    _subscription = databaseReference.onChildChanged.where((Event event) => event.snapshot.key == id.toString()).listen(
      (Event event) {
        logger.d('$tag => <listenChanges> => id: $id, new version: ${event.snapshot.value}');
        getData(id, event.snapshot.value);
      },
    );
  }

  Future<void> unsubscribeFromUpdates() async{
    await _subscription?.cancel();
  }

  Future<dynamic> getStoresVersions() async {
    final DataSnapshot data = await databaseReference.once();

    logger.d('Loaded data: ${data.value}, type: ${data.value.runtimeType}');

    return data.value;
  }
}
